# Easy PB Problems

NaPSで短時間に解ける、未圧縮のOPB問題をまとめています。

## 実行方法

PBSolverディレクトリから実行してください。

```bash
./naps/naps-1.02b problems/dec/grid6_07.opb
./naps/naps-1.02b problems/opt/clique_coloring_n5_t3.opb
```

モデル（変数の割り当て）を表示しない場合は、末尾に `-nm` を付けます。

```bash
./naps/naps-1.02b problems/opt/clique_coloring_n5_t3.opb -nm
```

## 問題一覧

### dec

充足可能性を判定する問題です。

| ファイル | 期待結果 | 実測時間 |
| --- | --- | ---: |
| `dec/grid6_07.opb` | `UNSATISFIABLE` | 約0.004秒 |
| `dec/subsetcard_eq_random4reg_10.opb` | `UNSATISFIABLE` | 約0.008秒 |
| `dec/sumineq_arity5_p005.opb` | `UNSATISFIABLE` | 約0.008秒 |

### opt

目的関数を最適化する問題です。

| ファイル | 期待結果 | 実測時間 |
| --- | --- | ---: |
| `opt/clique_coloring_n5_t3.opb` | `OPTIMUM FOUND`、最適値 `2` | 約0.017秒 |
| `opt/clique_coloring_n6_t4.opb` | `OPTIMUM FOUND`、最適値 `2` | 約0.078秒 |
| `opt/knapsack_profit_ceiling_20.opb` | `OPTIMUM FOUND`、最適値 `-318` | 約0.25秒 |

実測時間はこの環境での目安です。

## 時間制限付き実行

以下は10秒で打ち切る例です。

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data solver.log \
  --var result.var \
  ./naps/naps-1.02b problems/opt/clique_coloring_n5_t3.opb
```
