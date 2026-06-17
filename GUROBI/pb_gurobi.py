#!/usr/bin/env python3
"""Solve normalized linear OPB files with Gurobi and print PB-style output."""

from __future__ import annotations

import math
import os
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

default_license_file = Path.home() / ".gurobi" / "gurobi.lic"
if "GRB_LICENSE_FILE" not in os.environ and default_license_file.exists():
    os.environ["GRB_LICENSE_FILE"] = str(default_license_file)

try:
    import gurobipy as gp
    from gurobipy import GRB
except ImportError as error:
    print(
        "gurobipy が見つかりません。README.md の手順で Gurobi Python API を入れてください。",
        file=sys.stderr,
    )
    raise SystemExit(1) from error


@dataclass
class Term:
    name: str
    coefficient: float


@dataclass
class ParsedExpression:
    terms: List[Term]
    constant: float = 0.0


def tokenize(statement: str) -> List[str]:
    return statement.replace(";", " ; ").split()


def parse_number(token: str) -> float:
    try:
        return float(token)
    except ValueError as error:
        raise ValueError(f"数値を解釈できません: {token}") from error


def parse_expression(tokens: Sequence[str], begin: int, end: int) -> ParsedExpression:
    expression = ParsedExpression([])
    index = begin
    while index < end:
        if index + 1 >= end:
            raise ValueError("係数に対応する変数がありません")

        coefficient = parse_number(tokens[index])
        variable = tokens[index + 1]
        index += 2

        if variable.startswith("~"):
            expression.constant += coefficient
            expression.terms.append(Term(variable[1:], -coefficient))
        else:
            expression.terms.append(Term(variable, coefficient))

    return expression


def format_objective(value: float) -> str:
    if math.isfinite(value) and abs(value - round(value)) <= 1e-7:
        return str(int(round(value)))
    return f"{value:.17g}"


def get_or_create_variable(model: gp.Model, variables: Dict[str, gp.Var], name: str) -> gp.Var:
    if name not in variables:
        variables[name] = model.addVar(vtype=GRB.BINARY, name=name)
    return variables[name]


def build_linear_expression(
    model: gp.Model,
    variables: Dict[str, gp.Var],
    expression: ParsedExpression,
) -> gp.LinExpr:
    linear = gp.LinExpr()
    if expression.constant:
        linear += expression.constant
    for term in expression.terms:
        linear += term.coefficient * get_or_create_variable(model, variables, term.name)
    return linear


def add_objective(
    model: gp.Model,
    variables: Dict[str, gp.Var],
    tokens: Sequence[str],
) -> None:
    minimize = tokens[0] == "min:"
    if not minimize and tokens[0] != "max:":
        raise ValueError("目的関数は min: または max: で始めてください")

    expression = parse_expression(tokens, 1, len(tokens) - 1)
    model.setObjective(
        build_linear_expression(model, variables, expression),
        GRB.MINIMIZE if minimize else GRB.MAXIMIZE,
    )


def add_constraint(
    model: gp.Model,
    variables: Dict[str, gp.Var],
    tokens: Sequence[str],
    constraint_number: int,
) -> None:
    try:
        relation_index, relation = next(
            (index, token)
            for index, token in enumerate(tokens)
            if token in {">=", "<=", "="}
        )
    except StopIteration as error:
        raise ValueError("制約に >=、<=、= のいずれもありません") from error

    if relation_index + 1 >= len(tokens):
        raise ValueError("制約の右辺がありません")

    expression = parse_expression(tokens, 0, relation_index)
    rhs = parse_number(tokens[relation_index + 1]) - expression.constant
    linear = build_linear_expression(model, variables, expression)
    name = f"c{constraint_number}"

    if relation == ">=":
        model.addConstr(linear >= rhs, name=name)
    elif relation == "<=":
        model.addConstr(linear <= rhs, name=name)
    else:
        model.addConstr(linear == rhs, name=name)


def read_opb(filename: Path, model: gp.Model, variables: Dict[str, gp.Var]) -> bool:
    has_objective = False
    statement = ""
    constraint_number = 0

    with filename.open(encoding="utf-8") as input_file:
        for raw_line in input_file:
            line = raw_line.strip()
            if not line or line.startswith("*"):
                continue

            statement += " " + line
            if ";" not in line:
                continue

            tokens = tokenize(statement)
            if tokens and tokens[0] in {"min:", "max:"}:
                add_objective(model, variables, tokens)
                has_objective = True
            else:
                constraint_number += 1
                add_constraint(model, variables, tokens, constraint_number)
            statement = ""

    if statement.strip():
        raise ValueError("末尾がセミコロンで閉じられていません")

    print(f"c 読み込み完了: {len(variables)} 変数, {constraint_number} 制約")
    return has_objective


def status_name(status: int) -> str:
    names = {
        GRB.OPTIMAL: "OPTIMAL",
        GRB.INFEASIBLE: "INFEASIBLE",
        GRB.UNBOUNDED: "UNBOUNDED",
        GRB.INF_OR_UNBD: "INF_OR_UNBD",
        GRB.TIME_LIMIT: "TIME_LIMIT",
        GRB.INTERRUPTED: "INTERRUPTED",
        GRB.NUMERIC: "NUMERIC",
    }
    return names.get(status, f"STATUS_{status}")


def competition_status(status: int, has_objective: bool) -> str:
    if status == GRB.OPTIMAL:
        return "OPTIMUM FOUND" if has_objective else "SATISFIABLE"
    if status == GRB.INFEASIBLE:
        return "UNSATISFIABLE"
    return "UNKNOWN"


def print_competition_model(variables: Dict[str, gp.Var]) -> None:
    literals = []
    for name, variable in sorted(variables.items()):
        literals.append(name if variable.X > 0.5 else f"-{name}")
    print("v " + " ".join(literals))


def make_incumbent_callback(has_objective: bool, minimize: bool):
    best_objective: Optional[float] = None

    def callback(model: gp.Model, where: int) -> None:
        nonlocal best_objective
        if where == GRB.Callback.MIPSOL and has_objective:
            objective = model.cbGet(GRB.Callback.MIPSOL_OBJ)
            improved = (
                best_objective is None
                or (minimize and objective < best_objective - 1e-7)
                or (not minimize and objective > best_objective + 1e-7)
            )
            if improved:
                best_objective = objective
                print(f"o {format_objective(objective)}", flush=True)

    return callback


def solve(filename: Path, time_limit: float) -> int:
    model = gp.Model(filename.name)
    model.Params.OutputFlag = 0
    model.Params.MIPGap = 0.0
    model.Params.MIPGapAbs = 0.5
    model.Params.TimeLimit = time_limit

    variables: Dict[str, gp.Var] = {}
    has_objective = read_opb(filename, model, variables)
    model.optimize(make_incumbent_callback(has_objective, model.ModelSense == GRB.MINIMIZE))

    print(f"c Gurobi status: {status_name(model.Status)}")
    if model.SolCount > 0:
        print(f"c 目的値: {format_objective(model.ObjVal)}")
        true_variables = sorted(name for name, variable in variables.items() if variable.X > 0.5)
        print("c 真の変数:" + (" " + " ".join(true_variables) if true_variables else ""))

    print(f"s {competition_status(model.Status, has_objective)}")
    if model.SolCount > 0:
        print_competition_model(variables)

    return 0


def main(argv: Sequence[str]) -> int:
    if len(argv) not in {2, 3}:
        print(f"使い方: {argv[0]} <problem.opb> [time-limit-seconds]", file=sys.stderr)
        return 2

    filename = Path(argv[1])
    time_limit = parse_number(argv[2]) if len(argv) == 3 else 60.0
    try:
        return solve(filename, time_limit)
    except gp.GurobiError as error:
        print(f"Gurobiエラー: {error}", file=sys.stderr)
        return 1
    except Exception as error:
        print(f"エラー: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
