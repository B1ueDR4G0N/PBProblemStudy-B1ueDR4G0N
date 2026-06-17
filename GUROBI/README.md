# Gurobi PB Solver

Gurobiで正規化された線形OPB問題を解き、PBソルバ競技風の出力を行うPythonプログラムです。

## 前提

- Gurobi WLSライセンスが `~/.gurobi/gurobi.lic` にあること
- `gurobipy` がインストールされていること

この環境ではWLSライセンスファイルと `gurobipy` の動作を確認済みです。
ライセンスファイルには秘密情報が含まれるため、リポジトリには入れません。

## gurobipyの導入

`pip` が使える環境なら次で入れます。

```bash
python3 -m pip install --user gurobipy
```

今回の作業では、ユーザー領域に `pip` と `gurobipy 11.0.3` を導入済みです。

```bash
python3 - <<'PY'
import gurobipy as gp
print(gp.gurobi.version())
PY
```

`~/.gurobi/gurobi.lic` のWLSライセンスは確認済みです。
Python API同梱の古いPIPライセンスが優先される環境でも、このプログラムは
`~/.gurobi/gurobi.lic` を自動で `GRB_LICENSE_FILE` に設定します。

## 実行

PBSolverディレクトリから実行します。

```bash
python3 GUROBI/pb_gurobi.py problems/opt/clique_coloring_n5_t3.opb 10
```

出力例:

```text
c 読み込み完了: 55 変数, 245 制約
o 5
o 4
o 2
c Gurobi status: OPTIMAL
c 目的値: 2
s OPTIMUM FOUND
v x1 -x2 ...
```

## runsolver経由で実行

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data gurobi-solver.log \
  --var gurobi-result.var \
  python3 GUROBI/pb_gurobi.py problems/opt/clique_coloring_n5_t3.opb 10
```

## 対応形式

- 0-1変数
- `min:` / `max:` 目的関数
- `>=`、`<=`、`=` の線形制約
- 正負の整数係数
- `x1` および `~x1` 形式のリテラル

変数同士の積を含む非線形OPBには対応していません。

## 最適性ギャップ

PBの目的値は整数なので、比較実験ではGurobiのデフォルト相対ギャップではなく、
`MIPGap = 0.0`、`MIPGapAbs = 0.5` を設定しています。
これにより、整数目的値で1以上悪い解を `OPTIMUM FOUND` と扱うことを避けます。
