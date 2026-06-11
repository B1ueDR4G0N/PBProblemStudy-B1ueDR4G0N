# SCIP PB Solver

SCIPを使って、正規化された線形OPB問題を解く小さなC++プログラムです。

このプログラムは次の形式に対応します。

- 0-1変数
- `min:` / `max:` 目的関数
- `>=`、`<=`、`=` の線形制約
- 正負の整数係数
- `x1` および `~x1` 形式のリテラル

変数同士の積を含む非線形OPBには対応していません。

## 導入済みのSCIP

このディレクトリには、次のライブラリをローカル導入済みです。

- SCIP 9.2.4
- SoPlex 7.1.6
- インストール先: `SCIP/local`

バージョンを確認するには、PBSolverディレクトリから次を実行します。

```bash
./SCIP/local/bin/scip --version
```

## ビルド

PBSolverディレクトリから実行します。

```bash
cmake -S SCIP -B SCIP/build -DCMAKE_BUILD_TYPE=Release
cmake --build SCIP/build -j
```

通常はビルド済みの `SCIP/build/pb_scip` をそのまま実行できます。

## 実行

第2引数は時間制限です。省略時は60秒です。

```bash
./SCIP/build/pb_scip problems/opt/clique_coloring_n5_t3.opb
./SCIP/build/pb_scip problems/dec/grid6_07.opb 10
```

出力例:

```text
c 読み込み完了: 55 変数, 245 制約
o 5
o 4
o 2
c SCIP status: OPTIMAL
s OPTIMUM FOUND
v x1 -x2 ...
```

PBソルバ競技形式に従い、新しい最良解が見つかるたびに `o` 行を出力します。

- `c`: コメント・補足情報
- `o`: 暫定解の目的値
- `s`: 最終状態
- `v`: 最終解の変数割り当て

時間制限までに最適性を証明できなかった場合は `s UNKNOWN` を出力します。
実行可能解が見つかっていれば、その場合も最後に `v` 行を出力します。

## runsolver経由で実行

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data scip-solver.log \
  --var scip-result.var \
  ./SCIP/build/pb_scip problems/opt/clique_coloring_n5_t3.opb 10
```
