# 5ソルバ比較実験レポート

実験日: 2026-06-17

## 条件

- 対象問題: `problems/gurobi_scip/*.opb`
- 時間制限: runsolver wall clock 10秒、各ソルバー内部の時間制限も10秒
- NaPS: `naps/naps-1.02b`
- SCIP: `SCIP/build/pb_scip`
- Gurobi: `GUROBI/pb_gurobi.py`
- RoundingSat: `RoundingSat/bin/roundingsat`
- MaxSAT/RC2: `MAXSAT/pb_rc2.py`
- Gurobi設定: `MIPGap = 0.0`, `MIPGapAbs = 0.5`
- RoundingSat設定: `--time-limit=10 --print-sol=1`
- RC2設定: OPB制約をCNFへエンコードし、`min:` 目的関数を重み付きソフト節へ変換
- ソルバー出力: `results/gurobi_scip/{scip,gurobi,roundingsat,rc2}/*.watcher.log`
- runsolver計測: `results/gurobi_scip/{scip,gurobi,roundingsat,rc2}/*.var`

## SCIP / Gurobi 結果

| problem | SCIP status | SCIP obj | SCIP sec | Gurobi status | Gurobi obj | Gurobi sec | 検算 |
| --- | --- | ---: | ---: | --- | ---: | ---: | --- |
| `bitvector_equalities_17arraycomm` | SATISFIABLE | 0 | 0.042 | UNSATISFIABLE |  | 0.067 | SCIPの出力解が1制約違反 |
| `clique_coloring_n5_t3` | OPTIMUM FOUND | 2 | 0.116 | OPTIMUM FOUND | 2 | 0.062 | OK |
| `clique_coloring_n8_t6` | TIMEOUT | 2 | 10.002 | OPTIMUM FOUND | 2 | 0.305 | Gurobiのみ証明 |
| `knapsack_subset_sum_200` | OPTIMUM FOUND | -48992 | 0.196 | OPTIMUM FOUND | -48992 | 0.058 | OK |
| `maxcut_5partite_n27` | TIMEOUT | -169 | 10.005 | OPTIMUM FOUND | -180 | 2.653 | Gurobiのみ証明 |
| `miplib_air01_dec` | SATISFIABLE | 0 | 0.192 | SATISFIABLE | 0 | 0.050 | OK |
| `miplib_lp4l` | OPTIMUM FOUND | 2967 | 0.100 | OPTIMUM FOUND | 2967 | 0.100 | OK |
| `vertex_cover_grid_dim072` | TIMEOUT | 2664 | 10.004 | TIMEOUT | 2664 | 10.015 | 両方未証明 |

`TIMEOUT` 行の目的値は最後に出力された `o` 行、つまり暫定値です。runsolverによりプロセスが終了するため、タイムアウト時は最終 `s` 行や `v` 行が残らない場合があります。

## RoundingSatを追加した結果

| problem | RoundingSat status | obj/eval | sec | 検算 |
| --- | --- | ---: | ---: | --- |
| `bitvector_equalities_17arraycomm` | UNKNOWN / TIMEOUT |  | 10.002 | 解なし |
| `clique_coloring_n5_t3` | OPTIMUM FOUND | 2 | 0.086 | OK |
| `clique_coloring_n8_t6` | SATISFIABLE / TIMEOUT | 2 | 10.002 | OK |
| `knapsack_subset_sum_200` | OPTIMUM FOUND | -48992 | 0.012 | OK |
| `maxcut_5partite_n27` | SATISFIABLE / TIMEOUT | -180 | 10.002 | OK |
| `miplib_air01_dec` | SATISFIABLE |  | 0.015 | OK |
| `miplib_lp4l` | SATISFIABLE / TIMEOUT | 3088 | 10.003 | OK |
| `vertex_cover_grid_dim072` | OPTIMUM FOUND | 2664 | 7.230 | OK |

`SATISFIABLE / TIMEOUT` は、実行可能解は得たが最適性証明までは終わっていない状態です。`obj/eval` は `o` 行があればその値、なければ出力された `v` 行を元OPBで評価した値です。

## MaxSAT/RC2を追加した結果

PySATのRC2 MaxSATソルバを使い、OPBを「ハードPB制約のCNFエンコード + 重み付きソフト節」へ変換して解きました。

| problem | RC2 status | obj | sec | 検算 |
| --- | --- | ---: | ---: | --- |
| `bitvector_equalities_17arraycomm` | UNSATISFIABLE |  | 0.146 | 解なし |
| `clique_coloring_n5_t3` | OPTIMUM FOUND | 2 | 0.092 | OK |
| `clique_coloring_n8_t6` | OPTIMUM FOUND | 2 | 0.163 | OK |
| `knapsack_subset_sum_200` | TIMEOUT |  | 10.024 | 解なし |
| `maxcut_5partite_n27` | TIMEOUT |  | 10.003 | 解なし |
| `miplib_air01_dec` | TIMEOUT |  | 10.024 | 解なし |
| `miplib_lp4l` | TIMEOUT |  | 10.009 | 解なし |
| `vertex_cover_grid_dim072` | OPTIMUM FOUND | 2664 | 1.249 | OK |

RC2は `clique_coloring_n8_t6` と `vertex_cover_grid_dim072` でかなり速く、MaxSAT変換が効く問題では強く出ました。一方、`knapsack_subset_sum_200` やMIPLIB系では10秒で解が返らず、MIPソルバやPBネイティブソルバとは得意不得意がはっきり分かれます。

## NaPSを追加した結果

| problem | NaPS status | obj | sec | timeout |
| --- | --- | ---: | ---: | --- |
| `bitvector_equalities_17arraycomm` | UNKNOWN |  | 10.002 | yes |
| `clique_coloring_n5_t3` | OPTIMUM FOUND | 2 | 0.016 | no |
| `clique_coloring_n8_t6` | SATISFIABLE | 3 | 10.002 | yes |
| `knapsack_subset_sum_200` | UNKNOWN |  | 10.016 | yes |
| `maxcut_5partite_n27` | SATISFIABLE | -156 | 10.002 | yes |
| `miplib_air01_dec` | UNKNOWN |  | 10.022 | yes |
| `miplib_lp4l` | SATISFIABLE | 4499 | 10.009 | yes |
| `vertex_cover_grid_dim072` | SATISFIABLE | 2664 | 10.008 | yes |

NaPSは小さい論理・基数制約の `clique_coloring_n5_t3` では非常に速いですが、今回の10秒比較では大きめの最適化問題の証明には届きにくい結果でした。

## 観察

Gurobiが強く出た問題は `clique_coloring_n8_t6` と `maxcut_5partite_n27` です。SCIPは10秒では最適性証明まで届きませんでしたが、Gurobiはそれぞれ0.305秒、2.653秒で `OPTIMUM FOUND` まで到達しました。

小さい問題では両者とも十分速く、`miplib_lp4l` はほぼ同速でした。`knapsack_subset_sum_200` はGurobiが速いですが、SCIPも0.2秒未満で解けています。

RoundingSatは `knapsack_subset_sum_200` が非常に速く、0.012秒で最適値 `-48992` を証明しました。また `vertex_cover_grid_dim072` はSCIP/Gurobiが10秒で未証明だった一方、RoundingSatは7.230秒で `2664` の最適性を証明しました。反対に `miplib_lp4l` は10秒では最適性証明まで届かず、SCIP/Gurobiより苦戦しています。

RC2はMaxSAT変換が合う問題で鋭く、`clique_coloring_n8_t6` はGurobiよりも速い0.163秒で証明しました。ナップサックのような大きな重み付き単一PB制約では苦戦しており、MaxSAT系を入れたことで比較の絵がかなり立体的になりました。

`bitvector_equalities_17arraycomm` は比較表には残しましたが、性能比較の本命からは外すべきです。巨大係数を含む制約で、SCIP側の出力解を元OPBに照らすと1制約違反していました。大係数に対する数値許容誤差の影響を見る題材としては有用です。

## 実行コマンド

NaPS:

```bash
for problem in problems/gurobi_scip/*.opb; do
  name=$(basename "$problem" .opb)
  ./runsolver/src/runsolver \
    --wall-clock-limit 10 \
    --solver-data "results/run/naps/${name}.watcher.log" \
    --var "results/run/naps/${name}.var" \
    ./naps/naps-1.02b "$problem" \
    > "results/run/naps/${name}.log" 2>&1
done
```

SCIP:

```bash
for problem in problems/gurobi_scip/*.opb; do
  name=$(basename "$problem" .opb)
  ./runsolver/src/runsolver \
    --wall-clock-limit 10 \
    --solver-data "results/gurobi_scip/scip/${name}.watcher.log" \
    --var "results/gurobi_scip/scip/${name}.var" \
    ./SCIP/build/pb_scip "$problem" 10 \
    > "results/gurobi_scip/scip/${name}.log" 2>&1
done
```

Gurobi:

```bash
for problem in problems/gurobi_scip/*.opb; do
  name=$(basename "$problem" .opb)
  ./runsolver/src/runsolver \
    --wall-clock-limit 10 \
    --solver-data "results/gurobi_scip/gurobi/${name}.watcher.log" \
    --var "results/gurobi_scip/gurobi/${name}.var" \
    python3 GUROBI/pb_gurobi.py "$problem" 10 \
    > "results/gurobi_scip/gurobi/${name}.log" 2>&1
done
```

RoundingSat:

```bash
for problem in problems/gurobi_scip/*.opb; do
  name=$(basename "$problem" .opb)
  ./runsolver/src/runsolver \
    --wall-clock-limit 10 \
    --solver-data "results/gurobi_scip/roundingsat/${name}.watcher.log" \
    --var "results/gurobi_scip/roundingsat/${name}.var" \
    RoundingSat/bin/roundingsat --time-limit=10 --print-sol=1 "$problem" \
    > "results/gurobi_scip/roundingsat/${name}.log" 2>&1
done
```

MaxSAT/RC2:

```bash
for problem in problems/gurobi_scip/*.opb; do
  name=$(basename "$problem" .opb)
  ./runsolver/src/runsolver \
    --wall-clock-limit 10 \
    --solver-data "results/gurobi_scip/rc2/${name}.watcher.log" \
    --var "results/gurobi_scip/rc2/${name}.var" \
    python3 MAXSAT/pb_rc2.py "$problem" 10 \
    > "results/gurobi_scip/rc2/${name}.log" 2>&1
done
```

## メモ

Gurobiはデフォルトの相対MIPギャップだと、整数目的値でもわずかに悪い暫定解を `OPTIMAL` と扱う場合があります。今回の `knapsack_subset_sum_200` では、初期設定のままだと `-48990` が最適扱いになりました。PBソルバ大会風に比較するため、`GUROBI/pb_gurobi.py` でギャップ設定を明示しています。

RoundingSatは公式GitLabの静的Linuxバイナリを `RoundingSat/bin/roundingsat` に配置しています。ソースからビルドする場合はBoostが必要です。この環境ではaptにroot権限がなく `libboost-all-dev` を入れられなかったため、公式バイナリを使いました。

Open-WBOもMaxSAT系候補として `OpenWBO/` にクローンしています。README上はPB入力を `-formula=1` で扱えますが、この環境では `zlib.h`、`gmpxx.h`、`m4` が不足し、aptにroot権限がないためビルド未完了です。実用比較には、今回はPySAT RC2を採用しました。
