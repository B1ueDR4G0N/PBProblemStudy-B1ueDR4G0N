#!/usr/bin/env python3
"""Solve linear OPB files through PySAT's RC2 MaxSAT solver."""

from __future__ import annotations

import math
import signal
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Sequence, Tuple

from pysat.examples.rc2 import RC2
from pysat.formula import WCNF
from pysat.pb import PBEnc


@dataclass
class Term:
    name: str
    coefficient: int


@dataclass
class Expression:
    terms: List[Term]
    constant: int = 0


@dataclass
class Objective:
    minimize: bool
    expression: Expression


@dataclass
class Constraint:
    expression: Expression
    relation: str
    rhs: int


def tokenize(statement: str) -> List[str]:
    return statement.replace(";", " ; ").split()


def parse_number(token: str) -> int:
    value = float(token)
    if not math.isfinite(value) or abs(value - round(value)) > 1e-9:
        raise ValueError(f"整数係数ではありません: {token}")
    return int(round(value))


def parse_expression(tokens: Sequence[str], begin: int, end: int) -> Expression:
    expression = Expression([])
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


def read_opb(filename: Path) -> Tuple[Optional[Objective], List[Constraint]]:
    objective: Optional[Objective] = None
    constraints: List[Constraint] = []
    statement = ""

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
                objective = Objective(tokens[0] == "min:", parse_expression(tokens, 1, len(tokens) - 1))
            else:
                relation_index = next(
                    (index for index, token in enumerate(tokens) if token in {">=", "<=", "="}),
                    None,
                )
                if relation_index is None:
                    raise ValueError("制約に >=、<=、= のいずれもありません")
                constraints.append(
                    Constraint(
                        parse_expression(tokens, 0, relation_index),
                        tokens[relation_index],
                        parse_number(tokens[relation_index + 1]),
                    )
                )
            statement = ""

    if statement.strip():
        raise ValueError("末尾がセミコロンで閉じられていません")

    return objective, constraints


def var_id(name_to_id: Dict[str, int], name: str) -> int:
    if name not in name_to_id:
        name_to_id[name] = len(name_to_id) + 1
    return name_to_id[name]


def positive_pb_terms(expression: Expression, name_to_id: Dict[str, int]) -> Tuple[List[int], List[int], int]:
    lits: List[int] = []
    weights: List[int] = []
    constant = expression.constant

    for term in expression.terms:
        literal = var_id(name_to_id, term.name)
        coefficient = term.coefficient
        if coefficient >= 0:
            lits.append(literal)
            weights.append(coefficient)
        else:
            constant += coefficient
            lits.append(-literal)
            weights.append(-coefficient)

    return lits, weights, constant


def add_hard_clause(wcnf: WCNF, clause: List[int]) -> None:
    wcnf.append(clause)


def add_pb_constraint(wcnf: WCNF, constraint: Constraint, name_to_id: Dict[str, int], next_var: int) -> int:
    lits, weights, constant = positive_pb_terms(constraint.expression, name_to_id)
    bound = constraint.rhs - constant
    total = sum(weights)

    def add_encoding(encoding) -> int:
        for clause in encoding.clauses:
            add_hard_clause(wcnf, clause)
        return encoding.nv + 1

    if constraint.relation in {">=", "="}:
        if bound > total:
            add_hard_clause(wcnf, [])
        elif bound > 0:
            next_var = add_encoding(PBEnc.atleast(lits=lits, weights=weights, bound=bound, top_id=next_var - 1))

    if constraint.relation in {"<=", "="}:
        if bound < 0:
            add_hard_clause(wcnf, [])
        elif bound < total:
            next_var = add_encoding(PBEnc.atmost(lits=lits, weights=weights, bound=bound, top_id=next_var - 1))

    return max(next_var, len(name_to_id) + 1)


def add_objective(wcnf: WCNF, objective: Objective, name_to_id: Dict[str, int]) -> int:
    if not objective.minimize:
        raise ValueError("このRC2ラッパーは min: 目的関数だけに対応しています")

    constant = objective.expression.constant
    for term in objective.expression.terms:
        literal = var_id(name_to_id, term.name)
        coefficient = term.coefficient
        if coefficient >= 0:
            wcnf.append([-literal], weight=coefficient)
        else:
            constant += coefficient
            wcnf.append([literal], weight=-coefficient)
    return constant


def evaluate(expression: Expression, values: Dict[str, bool]) -> int:
    return expression.constant + sum(term.coefficient * int(values.get(term.name, False)) for term in expression.terms)


def print_model(name_to_id: Dict[str, int], model: Sequence[int]) -> Dict[str, bool]:
    true_ids = {literal for literal in model if literal > 0}
    values = {name: variable_id in true_ids for name, variable_id in name_to_id.items()}
    literals = [name if values[name] else f"-{name}" for name in sorted(name_to_id)]
    print("v " + " ".join(literals))
    return values


def solve(filename: Path, time_limit: Optional[int]) -> int:
    if time_limit is not None and time_limit > 0:
        signal.alarm(time_limit)

    objective, constraints = read_opb(filename)
    name_to_id: Dict[str, int] = {}
    wcnf = WCNF()

    objective_constant = 0
    if objective is not None:
        objective_constant = add_objective(wcnf, objective, name_to_id)

    next_var = len(name_to_id) + 1
    for constraint in constraints:
        next_var = add_pb_constraint(wcnf, constraint, name_to_id, next_var)

    print(f"c 読み込み完了: {len(name_to_id)} 変数, {len(constraints)} 制約")
    with RC2(wcnf) as solver:
        model = solver.compute()

    if model is None:
        print("s UNSATISFIABLE")
        return 0

    values = {name: var_id in {literal for literal in model if literal > 0} for name, var_id in name_to_id.items()}
    if objective is not None:
        objective_value = evaluate(objective.expression, values)
        print(f"o {objective_value}")
        print("s OPTIMUM FOUND")
    else:
        print("s SATISFIABLE")
    print_model(name_to_id, model)
    return 0


def main(argv: Sequence[str]) -> int:
    if len(argv) not in {2, 3}:
        print(f"使い方: {argv[0]} <problem.opb> [time-limit-seconds]", file=sys.stderr)
        return 2

    def timeout_handler(_signum, _frame):
        raise TimeoutError("time limit reached")

    signal.signal(signal.SIGALRM, timeout_handler)
    try:
        limit = int(float(argv[2])) if len(argv) == 3 else None
        return solve(Path(argv[1]), limit)
    except TimeoutError:
        print("s UNKNOWN")
        return 0
    except Exception as error:
        print(f"エラー: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
