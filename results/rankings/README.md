# 問題別ランキング

実験日: 2026-06-17

各問題について、「何系の問題か」と、5ソルバの順位をまとめたデータです。

## 順位ルール

PBO、つまり最適化問題では、次の順で順位を付けています。

1. `OPTIMUM FOUND`、つまり最適性証明済みを最優先
2. 最適性証明済み同士なら、壁時計時間 `WCTIME` が短い順
3. 未証明同士なら、暫定目的値が良い順
4. 暫定目的値も同じなら、時間が短い順
5. 解なし、`UNKNOWN`、検算NGは下位

PBS、つまり判定問題では、次の順で順位を付けています。

1. `SATISFIABLE` または `UNSATISFIABLE` の確定結果を優先
2. 確定結果同士なら、壁時計時間 `WCTIME` が短い順
3. `UNKNOWN`、タイムアウト、検算NGは下位

## 問題の種類

| problem | PBS/PBO | いわゆる何問題か | コメント |
| --- | --- | --- | --- |
| `bitvector_equalities_17arraycomm` | PBS | ビットベクトル等式/大係数PB | 数値誤差の観察用。SCIP解は検算NG |
| `clique_coloring_n5_t3` | PBO | クリーク彩色/論理・基数制約 | NaPSが最速になる小規模例 |
| `clique_coloring_n8_t6` | PBO | クリーク彩色/論理・基数制約 | RC2とGurobiが強い |
| `knapsack_subset_sum_200` | PBO | ナップサック/部分和型 | RoundingSat、Gurobi、SCIPが強い |
| `maxcut_5partite_n27` | PBO | MaxCut | Gurobiが最も強い |
| `miplib_air01_dec` | PBS | MIPLIB由来の判定問題 | RoundingSat、Gurobi、SCIPが速い |
| `miplib_lp4l` | PBO | MIPLIB由来の線形最適化 | GurobiとSCIPが強い |
| `vertex_cover_grid_dim072` | PBO | 頂点被覆 | MaxSAT/RC2、RoundingSat、NaPSが強い |

## 10秒比較ランキング

### `bitvector_equalities_17arraycomm`

PBS。ビットベクトル等式/大係数PBです。

| rank | solver | result | time | note |
| ---: | --- | --- | ---: | --- |
| 1 | Gurobi | UNSATISFIABLE | 0.067 | 確定 |
| 2 | MaxSAT/RC2 | UNSATISFIABLE | 0.146 | 確定 |
| 3 | NaPS | UNKNOWN | 10.002 | timeout |
| 4 | RoundingSat | UNKNOWN | 10.002 | timeout |
| 5 | SCIP | SATISFIABLE | 0.042 | 出力解が元OPBで1制約違反 |

### `clique_coloring_n5_t3`

PBO。小規模クリーク彩色/論理・基数制約です。

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | NaPS | OPTIMUM FOUND | 2 | 0.016179 |
| 2 | MaxSAT/RC2 | OPTIMUM FOUND | 2 | 0.081576 |
| 3 | RoundingSat | OPTIMUM FOUND | 2 | 0.092394 |
| 4 | SCIP | OPTIMUM FOUND | 2 | 0.106069 |
| 5 | Gurobi | OPTIMUM FOUND | 2 | 0.523967 |

### `clique_coloring_n8_t6`

PBO。中規模クリーク彩色/論理・基数制約です。

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | MaxSAT/RC2 | OPTIMUM FOUND | 2 | 0.163 |
| 2 | Gurobi | OPTIMUM FOUND | 2 | 0.305 |
| 3 | RoundingSat | SATISFIABLE / TIMEOUT | 2 | 10.002 |
| 4 | SCIP | TIMEOUT | 2 | 10.002 |
| 5 | NaPS | SATISFIABLE / TIMEOUT | 3 | 10.002 |

### `knapsack_subset_sum_200`

PBO。ナップサック/部分和型です。

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | RoundingSat | OPTIMUM FOUND | -48992 | 0.012 |
| 2 | Gurobi | OPTIMUM FOUND | -48992 | 0.058 |
| 3 | SCIP | OPTIMUM FOUND | -48992 | 0.196 |
| 4 | NaPS | UNKNOWN |  | 10.016 |
| 5 | MaxSAT/RC2 | TIMEOUT |  | 10.024 |

### `maxcut_5partite_n27`

PBO。MaxCutです。

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | Gurobi | OPTIMUM FOUND | -180 | 2.653 |
| 2 | RoundingSat | SATISFIABLE / TIMEOUT | -180 | 10.002 |
| 3 | SCIP | TIMEOUT | -169 | 10.005 |
| 4 | NaPS | SATISFIABLE / TIMEOUT | -156 | 10.002 |
| 5 | MaxSAT/RC2 | TIMEOUT |  | 10.003 |

### `miplib_air01_dec`

PBS。MIPLIB由来の判定問題です。

| rank | solver | result | time | note |
| ---: | --- | --- | ---: | --- |
| 1 | RoundingSat | SATISFIABLE | 0.015 | 確定 |
| 2 | Gurobi | SATISFIABLE | 0.050 | 確定 |
| 3 | SCIP | SATISFIABLE | 0.192 | 確定 |
| 4 | NaPS | UNKNOWN | 10.022 | timeout |
| 5 | MaxSAT/RC2 | TIMEOUT | 10.024 | no-sol |

### `miplib_lp4l`

PBO。MIPLIB由来の線形最適化です。

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | Gurobi | OPTIMUM FOUND | 2967 | 0.100 |
| 2 | SCIP | OPTIMUM FOUND | 2967 | 0.100 |
| 3 | RoundingSat | SATISFIABLE / TIMEOUT | 3088 | 10.003 |
| 4 | NaPS | SATISFIABLE / TIMEOUT | 4499 | 10.009 |
| 5 | MaxSAT/RC2 | TIMEOUT |  | 10.009 |

GurobiとSCIPはほぼ同速ですが、計測値ではGurobiを上位にしています。

### `vertex_cover_grid_dim072`

PBO。頂点被覆です。

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | MaxSAT/RC2 | OPTIMUM FOUND | 2664 | 1.249 |
| 2 | RoundingSat | OPTIMUM FOUND | 2664 | 7.230 |
| 3 | SCIP | TIMEOUT | 2664 | 10.004 |
| 4 | NaPS | SATISFIABLE / TIMEOUT | 2664 | 10.008 |
| 5 | Gurobi | TIMEOUT | 2664 | 10.015 |

## 60秒比較ランキング

60秒比較は、先に差が出やすい4問で実施し、その後10秒では測っていたが60秒では未測定だった4問を追加しました。

### `bitvector_equalities_17arraycomm`

| rank | solver | result | time | note |
| ---: | --- | --- | ---: | --- |
| 1 | MaxSAT/RC2 | UNSATISFIABLE | 0.168 | 確定 |
| 2 | Gurobi | UNSATISFIABLE | 0.491 | 確定 |
| 3 | RoundingSat | UNSATISFIABLE | 10.243 | 確定 |
| 4 | NaPS | UNKNOWN | 60.003 | timeout |
| 5 | SCIP | SATISFIABLE | 0.044 | 出力解が元OPBで制約違反 |

### `clique_coloring_n5_t3`

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | NaPS | OPTIMUM FOUND | 2 | 0.015 |
| 2 | Gurobi | OPTIMUM FOUND | 2 | 0.064 |
| 3 | MaxSAT/RC2 | OPTIMUM FOUND | 2 | 0.082 |
| 4 | RoundingSat | OPTIMUM FOUND | 2 | 0.098 |
| 5 | SCIP | OPTIMUM FOUND | 2 | 0.105 |

### `clique_coloring_n8_t6`

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | MaxSAT/RC2 | OPTIMUM FOUND | 2 | 0.152 |
| 2 | Gurobi | OPTIMUM FOUND | 2 | 0.671 |
| 3 | SCIP | OPTIMUM FOUND | 2 | 21.258 |
| 4 | RoundingSat | SATISFIABLE / TIMEOUT | 2 | 60.002 |
| 5 | NaPS | SATISFIABLE / TIMEOUT | 3 | 60.002 |

### `knapsack_subset_sum_200`

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | RoundingSat | OPTIMUM FOUND | -48992 | 0.012 |
| 2 | Gurobi | OPTIMUM FOUND | -48992 | 0.061 |
| 3 | SCIP | OPTIMUM FOUND | -48992 | 0.142 |
| 4 | NaPS | SATISFIABLE / TIMEOUT | -48932 | 60.019 |
| 5 | MaxSAT/RC2 | TIMEOUT |  | 60.034 |

### `maxcut_5partite_n27`

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | Gurobi | OPTIMUM FOUND | -180 | 2.673 |
| 2 | SCIP | OPTIMUM FOUND | -180 | 19.653 |
| 3 | RoundingSat | SATISFIABLE / TIMEOUT | -180 | 60.003 |
| 4 | NaPS | SATISFIABLE / TIMEOUT | -176 | 60.002 |
| 5 | MaxSAT/RC2 | TIMEOUT |  | 60.004 |

### `miplib_air01_dec`

| rank | solver | result | time | note |
| ---: | --- | --- | ---: | --- |
| 1 | RoundingSat | SATISFIABLE | 0.017 | 確定 |
| 2 | Gurobi | SATISFIABLE | 0.047 | 確定 |
| 3 | SCIP | SATISFIABLE | 0.205 | 確定 |
| 4 | NaPS | SATISFIABLE | 16.549 | 確定 |
| 5 | MaxSAT/RC2 | TIMEOUT | 60.022 | no-sol |

### `miplib_lp4l`

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | Gurobi | OPTIMUM FOUND | 2967 | 0.104 |
| 2 | SCIP | OPTIMUM FOUND | 2967 | 0.119 |
| 3 | RoundingSat | OPTIMUM FOUND | 2967 | 17.965 |
| 4 | NaPS | SATISFIABLE / TIMEOUT | 4499 | 60.007 |
| 5 | MaxSAT/RC2 | TIMEOUT |  | 60.013 |

### `vertex_cover_grid_dim072`

| rank | solver | result | value | time |
| ---: | --- | --- | ---: | ---: |
| 1 | MaxSAT/RC2 | OPTIMUM FOUND | 2664 | 1.167 |
| 2 | RoundingSat | OPTIMUM FOUND | 2664 | 7.068 |
| 3 | NaPS | OPTIMUM FOUND | 2664 | 9.503 |
| 4 | SCIP | TIMEOUT | 2664 | 60.008 |
| 5 | Gurobi | TIMEOUT | 2664 | 60.016 |

## 備考

- `TIMEOUT` で `value` があるものは、最後に観測された暫定値です。
- `SATISFIABLE / TIMEOUT` は、実行可能解は出たが最適性証明が終わっていない状態です。
- `bitvector_equalities_17arraycomm` のSCIP結果は検算NGなので、性能評価では参考扱いです。
