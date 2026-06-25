# Gurobi / SCIP 比較用問題

このディレクトリには、過去のGurobi/SCIP比較で使った問題名と実行方法のメモを残しています。
外部ベンチマーク由来の `.opb` 本体は、再配布条件をこのリポジトリ側で保証できないためGitでは追跡しません。
問題本体は [Pseudo-Boolean Competition 2025](https://www.cril.univ-artois.fr/PB25/) の **Benchmarks available in the PB24 format** にある `normalized-PB24.tar` などから取得できます。

10秒制限での実測レポートは [results/gurobi_scip/README.md](../../results/gurobi_scip/README.md) に保存しています。現在はSCIP、Gurobi、RoundingSat、MaxSAT/RC2を比較しています。

## 問題一覧

| ファイル | 狙い |
| --- | --- |
| `knapsack_subset_sum_200.opb` | 1制約ナップサック。MIPソルバが得意な基本形 |
| `miplib_lp4l.opb` | MIPLIB由来。等式が多い線形最適化 |
| `bitvector_equalities_17arraycomm.opb` | 大係数等式が多い判定問題。SCIPの数値許容誤差の観察用 |
| `miplib_air01_dec.opb` | MIPLIB由来の判定問題 |
| `clique_coloring_n5_t3.opb` | 小さいが密な論理・基数制約 |
| `clique_coloring_n8_t6.opb` | 密な論理・基数制約の中規模版 |
| `vertex_cover_grid_dim072.opb` | 大きめのグリッド頂点被覆 |
| `maxcut_5partite_n27.opb` | 密なMaxCut最適化 |

## SCIPで測る

```bash
for problem in problems/sample/*.opb; do
  name=$(basename "$problem" .opb)
  ./runsolver/src/runsolver \
    --wall-clock-limit 10 \
    --solver-data "scip-${name}.log" \
    --var "scip-${name}.var" \
    ./SCIP/build/pb_scip "$problem" 10
done
```

結果確認:

```bash
grep -E '^(o |s )' scip-*.log
grep -E '^(WCTIME|TIMEOUT)=' scip-*.var
```

## Gurobiで測る

```bash
for problem in problems/sample/*.opb; do
  name=$(basename "$problem" .opb)
  ./runsolver/src/runsolver \
    --wall-clock-limit 10 \
    --solver-data "gurobi-${name}.log" \
    --var "gurobi-${name}.var" \
    python3 GUROBI/pb_gurobi.py "$problem" 10
done
```

Gurobi版も `o`、`s`、`v` を出すため、SCIP版と同じ集計方法で比較できます。
