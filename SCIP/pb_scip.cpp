#include <scip/cons_linear.h>
#include <scip/scip.h>
#include <scip/scipdefplugins.h>

#include <algorithm>
#include <cctype>
#include <fstream>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <utility>
#include <vector>

namespace
{

struct Term
{
   std::string name;
   SCIP_Real coefficient;
};

struct ParsedExpression
{
   std::vector<Term> terms;
   SCIP_Real constant = 0.0;
};

std::string trim(const std::string& text)
{
   const auto first = std::find_if_not(text.begin(), text.end(), [](unsigned char c) { return std::isspace(c); });
   const auto last = std::find_if_not(text.rbegin(), text.rend(), [](unsigned char c) { return std::isspace(c); }).base();
   return first < last ? std::string(first, last) : std::string();
}

std::vector<std::string> tokenize(std::string statement)
{
   for( std::size_t pos = 0; (pos = statement.find(';', pos)) != std::string::npos; pos += 3 )
      statement.replace(pos, 1, " ; ");

   std::istringstream input(statement);
   std::vector<std::string> tokens;
   std::string token;
   while( input >> token )
      tokens.push_back(token);
   return tokens;
}

SCIP_Real parseNumber(const std::string& token)
{
   std::size_t parsed = 0;
   const SCIP_Real value = std::stod(token, &parsed);
   if( parsed != token.size() )
      throw std::runtime_error("数値を解釈できません: " + token);
   return value;
}

ParsedExpression parseExpression(
   const std::vector<std::string>& tokens,
   std::size_t begin,
   std::size_t end
)
{
   ParsedExpression expression;
   for( std::size_t i = begin; i < end; )
   {
      if( i + 1 >= end )
         throw std::runtime_error("係数に対応する変数がありません");

      const SCIP_Real coefficient = parseNumber(tokens[i++]);
      std::string variable = tokens[i++];

      if( variable.front() == '~' )
      {
         expression.constant += coefficient;
         variable.erase(variable.begin());
         expression.terms.push_back({variable, -coefficient});
      }
      else
         expression.terms.push_back({variable, coefficient});
   }
   return expression;
}

SCIP_VAR* getOrCreateVariable(
   SCIP* scip,
   std::unordered_map<std::string, SCIP_VAR*>& variables,
   const std::string& name
)
{
   const auto found = variables.find(name);
   if( found != variables.end() )
      return found->second;

   SCIP_VAR* variable = nullptr;
   SCIP_CALL_ABORT(SCIPcreateVarBasic(
      scip, &variable, name.c_str(), 0.0, 1.0, 0.0, SCIP_VARTYPE_BINARY));
   SCIP_CALL_ABORT(SCIPaddVar(scip, variable));
   variables.emplace(name, variable);
   return variable;
}

void addObjective(
   SCIP* scip,
   std::unordered_map<std::string, SCIP_VAR*>& variables,
   const std::vector<std::string>& tokens
)
{
   if( tokens.empty() )
      return;

   const bool minimize = tokens[0] == "min:";
   if( !minimize && tokens[0] != "max:" )
      throw std::runtime_error("目的関数は min: または max: で始めてください");

   SCIP_CALL_ABORT(SCIPsetObjsense(scip, minimize ? SCIP_OBJSENSE_MINIMIZE : SCIP_OBJSENSE_MAXIMIZE));
   const ParsedExpression expression = parseExpression(tokens, 1, tokens.size() - 1);
   for( const Term& term : expression.terms )
   {
      SCIP_VAR* variable = getOrCreateVariable(scip, variables, term.name);
      SCIP_CALL_ABORT(SCIPchgVarObj(scip, variable, term.coefficient));
   }
}

void addConstraint(
   SCIP* scip,
   std::unordered_map<std::string, SCIP_VAR*>& variables,
   const std::vector<std::string>& tokens,
   int constraintNumber
)
{
   const auto relation = std::find_if(tokens.begin(), tokens.end(), [](const std::string& token) {
      return token == ">=" || token == "<=" || token == "=";
   });
   if( relation == tokens.end() )
      throw std::runtime_error("制約に >=、<=、= のいずれもありません");

   const std::size_t relationIndex = static_cast<std::size_t>(relation - tokens.begin());
   if( relationIndex + 1 >= tokens.size() )
      throw std::runtime_error("制約の右辺がありません");

   const ParsedExpression expression = parseExpression(tokens, 0, relationIndex);
   const SCIP_Real rhs = parseNumber(tokens[relationIndex + 1]) - expression.constant;

   std::vector<SCIP_VAR*> constraintVariables;
   std::vector<SCIP_Real> coefficients;
   constraintVariables.reserve(expression.terms.size());
   coefficients.reserve(expression.terms.size());
   for( const Term& term : expression.terms )
   {
      constraintVariables.push_back(getOrCreateVariable(scip, variables, term.name));
      coefficients.push_back(term.coefficient);
   }

   SCIP_Real lhsBound = -SCIPinfinity(scip);
   SCIP_Real rhsBound = SCIPinfinity(scip);
   if( *relation == ">=" )
      lhsBound = rhs;
   else if( *relation == "<=" )
      rhsBound = rhs;
   else
      lhsBound = rhsBound = rhs;

   SCIP_CONS* constraint = nullptr;
   const std::string name = "c" + std::to_string(constraintNumber);
   SCIP_CALL_ABORT(SCIPcreateConsBasicLinear(
      scip,
      &constraint,
      name.c_str(),
      static_cast<int>(constraintVariables.size()),
      constraintVariables.data(),
      coefficients.data(),
      lhsBound,
      rhsBound));
   SCIP_CALL_ABORT(SCIPaddCons(scip, constraint));
   SCIP_CALL_ABORT(SCIPreleaseCons(scip, &constraint));
}

void readOpb(
   SCIP* scip,
   const std::string& filename,
   std::unordered_map<std::string, SCIP_VAR*>& variables
)
{
   std::ifstream input(filename);
   if( !input )
      throw std::runtime_error("問題ファイルを開けません: " + filename);

   std::string line;
   std::string statement;
   int constraintNumber = 0;
   while( std::getline(input, line) )
   {
      line = trim(line);
      if( line.empty() || line.front() == '*' )
         continue;

      statement += " " + line;
      if( line.find(';') == std::string::npos )
         continue;

      const std::vector<std::string> tokens = tokenize(statement);
      if( !tokens.empty() && (tokens[0] == "min:" || tokens[0] == "max:") )
         addObjective(scip, variables, tokens);
      else
         addConstraint(scip, variables, tokens, ++constraintNumber);
      statement.clear();
   }

   if( !trim(statement).empty() )
      throw std::runtime_error("末尾がセミコロンで閉じられていません");

   std::cout << "読み込み完了: " << variables.size() << " 変数, "
             << constraintNumber << " 制約\n";
}

const char* statusName(SCIP_STATUS status)
{
   switch( status )
   {
   case SCIP_STATUS_OPTIMAL:
      return "OPTIMAL";
   case SCIP_STATUS_INFEASIBLE:
      return "INFEASIBLE";
   case SCIP_STATUS_UNBOUNDED:
      return "UNBOUNDED";
   case SCIP_STATUS_INFORUNBD:
      return "INFEASIBLE OR UNBOUNDED";
   case SCIP_STATUS_TIMELIMIT:
      return "TIME LIMIT";
   case SCIP_STATUS_MEMLIMIT:
      return "MEMORY LIMIT";
   default:
      return "UNKNOWN";
   }
}

SCIP_RETCODE solve(const std::string& filename, SCIP_Real timeLimit)
{
   SCIP* scip = nullptr;
   SCIP_CALL(SCIPcreate(&scip));
   SCIP_CALL(SCIPincludeDefaultPlugins(scip));
   SCIP_CALL(SCIPcreateProbBasic(scip, filename.c_str()));
   SCIP_CALL(SCIPsetRealParam(scip, "limits/time", timeLimit));

   std::unordered_map<std::string, SCIP_VAR*> variables;
   try
   {
      readOpb(scip, filename, variables);
   }
   catch( const std::exception& error )
   {
      std::cerr << "OPB読み込みエラー: " << error.what() << '\n';
      for( auto& item : variables )
         SCIP_CALL(SCIPreleaseVar(scip, &item.second));
      SCIP_CALL(SCIPfree(&scip));
      return SCIP_READERROR;
   }

   SCIP_CALL(SCIPsolve(scip));
   std::cout << "状態: " << statusName(SCIPgetStatus(scip)) << '\n';

   SCIP_SOL* solution = SCIPgetBestSol(scip);
   if( solution != nullptr )
   {
      std::cout << "目的値: " << SCIPgetSolOrigObj(scip, solution) << "\n真の変数:";
      std::vector<std::string> trueVariables;
      for( const auto& item : variables )
      {
         if( SCIPgetSolVal(scip, solution, item.second) > 0.5 )
            trueVariables.push_back(item.first);
      }
      std::sort(trueVariables.begin(), trueVariables.end());
      for( const std::string& name : trueVariables )
         std::cout << ' ' << name;
      std::cout << '\n';
   }

   for( auto& item : variables )
      SCIP_CALL(SCIPreleaseVar(scip, &item.second));
   SCIP_CALL(SCIPfree(&scip));
   return SCIP_OKAY;
}

} // namespace

int main(int argc, char** argv)
{
   if( argc < 2 || argc > 3 )
   {
      std::cerr << "使い方: " << argv[0] << " <problem.opb> [time-limit-seconds]\n";
      return 2;
   }

   try
   {
      const SCIP_Real timeLimit = argc == 3 ? parseNumber(argv[2]) : 60.0;
      return solve(argv[1], timeLimit) == SCIP_OKAY ? 0 : 1;
   }
   catch( const std::exception& error )
   {
      std::cerr << "エラー: " << error.what() << '\n';
      return 1;
   }
}
