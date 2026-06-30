# 60秒比較実験レポート

実験日: 2026-06-17  
追加実験日: 2026-06-30

10秒実験で差が出やすかった4問を先に選び、NaPS、SCIP、Gurobi、RoundingSat、MaxSAT/RC2で60秒制限の比較を行いました。
その後、10秒では測定していたが60秒では未測定だった4問も追加で実行しました。

## 条件

- 対象問題:
  - `bitvector_equalities_17arraycomm.opb`
  - `clique_coloring_n5_t3.opb`
  - `clique_coloring_n8_t6.opb`
  - `knapsack_subset_sum_200.opb`
  - `maxcut_5partite_n27.opb`
  - `miplib_air01_dec.opb`
  - `miplib_lp4l.opb`
  - `vertex_cover_grid_dim072.opb`
- 外側制限: `runsolver --wall-clock-limit 60`
- 内側制限:
  - SCIP: `pb_scip <problem> 60`
  - Gurobi: `pb_gurobi.py <problem> 60`
  - RoundingSat: `--time-limit=60 --print-sol=1`
  - MaxSAT/RC2: `pb_rc2.py <problem> 60`
  - NaPS: runsolverの外側制限のみ
- 個別ログは保存せず、要約のみこのレポートに残しています。

## 結果

| problem | solver | status | value | sec | check |
| --- | --- | --- | ---: | ---: | --- |
| `bitvector_equalities_17arraycomm` | NaPS | UNKNOWN |  | 60.003 | timeout |
| `bitvector_equalities_17arraycomm` | SCIP | SATISFIABLE |  | 0.044 | invalid |
| `bitvector_equalities_17arraycomm` | Gurobi | UNSATISFIABLE |  | 0.491 | OK |
| `bitvector_equalities_17arraycomm` | RoundingSat | UNSATISFIABLE |  | 10.243 | OK |
| `bitvector_equalities_17arraycomm` | MaxSAT/RC2 | UNSATISFIABLE |  | 0.168 | OK |
| `clique_coloring_n5_t3` | NaPS | OPTIMUM FOUND | 2 | 0.015 | OK |
| `clique_coloring_n5_t3` | SCIP | OPTIMUM FOUND | 2 | 0.105 | OK |
| `clique_coloring_n5_t3` | Gurobi | OPTIMUM FOUND | 2 | 0.064 | OK |
| `clique_coloring_n5_t3` | RoundingSat | OPTIMUM FOUND | 2 | 0.098 | OK |
| `clique_coloring_n5_t3` | MaxSAT/RC2 | OPTIMUM FOUND | 2 | 0.082 | OK |
| `clique_coloring_n8_t6` | NaPS | SATISFIABLE / TIMEOUT | 3 | 60.002 | OK |
| `clique_coloring_n8_t6` | SCIP | OPTIMUM FOUND | 2 | 21.258 | OK |
| `clique_coloring_n8_t6` | Gurobi | OPTIMUM FOUND | 2 | 0.671 | OK |
| `clique_coloring_n8_t6` | RoundingSat | SATISFIABLE / TIMEOUT | 2 | 60.002 | OK |
| `clique_coloring_n8_t6` | MaxSAT/RC2 | OPTIMUM FOUND | 2 | 0.152 | OK |
| `knapsack_subset_sum_200` | NaPS | SATISFIABLE / TIMEOUT | -48932 | 60.019 | OK |
| `knapsack_subset_sum_200` | SCIP | OPTIMUM FOUND | -48992 | 0.142 | OK |
| `knapsack_subset_sum_200` | Gurobi | OPTIMUM FOUND | -48992 | 0.061 | OK |
| `knapsack_subset_sum_200` | RoundingSat | OPTIMUM FOUND | -48992 | 0.012 | OK |
| `knapsack_subset_sum_200` | MaxSAT/RC2 | TIMEOUT |  | 60.034 | no-sol |
| `maxcut_5partite_n27` | NaPS | SATISFIABLE / TIMEOUT | -176 | 60.002 | OK |
| `maxcut_5partite_n27` | SCIP | OPTIMUM FOUND | -180 | 19.653 | OK |
| `maxcut_5partite_n27` | Gurobi | OPTIMUM FOUND | -180 | 2.673 | OK |
| `maxcut_5partite_n27` | RoundingSat | SATISFIABLE / TIMEOUT | -180 | 60.003 | OK |
| `maxcut_5partite_n27` | MaxSAT/RC2 | TIMEOUT |  | 60.004 | no-sol |
| `miplib_air01_dec` | NaPS | SATISFIABLE |  | 16.549 | OK |
| `miplib_air01_dec` | SCIP | SATISFIABLE |  | 0.205 | OK |
| `miplib_air01_dec` | Gurobi | SATISFIABLE |  | 0.047 | OK |
| `miplib_air01_dec` | RoundingSat | SATISFIABLE |  | 0.017 | OK |
| `miplib_air01_dec` | MaxSAT/RC2 | TIMEOUT |  | 60.022 | no-sol |
| `miplib_lp4l` | NaPS | SATISFIABLE / TIMEOUT | 4499 | 60.007 | OK |
| `miplib_lp4l` | SCIP | OPTIMUM FOUND | 2967 | 0.119 | OK |
| `miplib_lp4l` | Gurobi | OPTIMUM FOUND | 2967 | 0.104 | OK |
| `miplib_lp4l` | RoundingSat | OPTIMUM FOUND | 2967 | 17.965 | OK |
| `miplib_lp4l` | MaxSAT/RC2 | TIMEOUT |  | 60.013 | no-sol |
| `vertex_cover_grid_dim072` | NaPS | OPTIMUM FOUND | 2664 | 9.503 | OK |
| `vertex_cover_grid_dim072` | SCIP | TIMEOUT | 2664 | 60.008 | no-sol |
| `vertex_cover_grid_dim072` | Gurobi | TIMEOUT | 2664 | 60.016 | no-sol |
| `vertex_cover_grid_dim072` | RoundingSat | OPTIMUM FOUND | 2664 | 7.068 | OK |
| `vertex_cover_grid_dim072` | MaxSAT/RC2 | OPTIMUM FOUND | 2664 | 1.167 | OK |

`SATISFIABLE / TIMEOUT` は、実行可能解は得たが最適性証明は未完了という意味です。`value` は最終 `o` 行、または `v` 行を元OPBで評価した値です。
`bitvector_equalities_17arraycomm` のSCIP結果は、ソルバ出力上は `SATISFIABLE` ですが、元OPB検算で制約違反が確認されているため `invalid` として扱います。

## 差が出たポイント

**論理・基数制約: `clique_coloring_n8_t6`**

MaxSAT/RC2が最速で、0.152秒で最適値2を証明しました。Gurobiも0.671秒で速いです。SCIPは60秒なら21.258秒で証明できます。NaPSは60秒でも暫定値3止まり、RoundingSatは値2の実行可能解を持つものの証明までは届きませんでした。

**小規模論理・基数制約: `clique_coloring_n5_t3`**

全ソルバが0.2秒以内に最適値2を証明しました。NaPSが0.015秒で最速で、問題が小さいとGurobiやSCIPの汎用MIPソルバとしての起動・モデル構築コストが相対的に見えます。ただし差は小さく、性能比較の主戦場というより動作確認向きの問題です。

**巨大係数PBS: `bitvector_equalities_17arraycomm`**

MaxSAT/RC2が0.168秒、Gurobiが0.491秒、RoundingSatが10.243秒でUNSATを証明しました。NaPSは60秒でもUNKNOWNでした。SCIPはすぐSATを返しますが検算NGなので、この問題では「速い」ではなく「数値許容誤差に注意すべき例」として扱うのが妥当です。

**単一ナップサック: `knapsack_subset_sum_200`**

RoundingSatが0.012秒で最速、Gurobiが0.061秒、SCIPが0.142秒で最適値-48992を証明しました。NaPSは60秒で暫定値-48932まで改善しましたが最適性証明には届かず、MaxSAT/RC2は解を返せませんでした。PBネイティブ系とMIP系が強く、MaxSAT変換は重くなりやすい例です。

**MaxCut: `maxcut_5partite_n27`**

Gurobiが明確に強く、2.673秒で最適値-180を証明しました。SCIPも60秒なら19.653秒で証明できます。RoundingSatは最適値-180の実行可能解を見つけましたが、証明は未完了です。RC2は60秒で解を返せませんでした。

**MIPLIB系線形最適化: `miplib_lp4l`**

SCIPとGurobiが非常に強く、どちらも0.1秒前後で最適値2967を証明しました。RoundingSatも60秒なら17.965秒で証明できます。NaPSとRC2はこのタイプでは苦戦します。

**MIPLIB由来PBS: `miplib_air01_dec`**

RoundingSatが0.017秒、Gurobiが0.047秒、SCIPが0.205秒でSATを証明しました。NaPSも16.549秒でSATに到達し、10秒制限では見えなかった改善が確認できました。MaxSAT/RC2は60秒でも解を返せませんでした。

**頂点被覆: `vertex_cover_grid_dim072`**

MaxSAT/RC2が1.167秒で最速、RoundingSatが7.068秒、NaPSが9.503秒で最適値2664を証明しました。SCIPとGurobiは60秒でも最適性証明できませんでした。この問題はMIP系よりもPB/MaxSAT系が強く出る良い例です。

## 得意分野の更新

| ソルバ | 60秒実験で見えた得意分野 |
| --- | --- |
| NaPS | 小さい論理系、頂点被覆系。`clique_coloring_n5_t3` と `vertex_cover_grid_dim072` が強く、`miplib_air01_dec` も60秒ならSAT到達 |
| SCIP | MIPLIB系、MaxCut、時間を伸ばした論理系。10秒では未証明だった2問を60秒で証明 |
| Gurobi | MIPLIB系とMaxCutが強い。`maxcut_5partite_n27` は5ソルバ中で最も強い |
| RoundingSat | PBネイティブ系、ナップサック、頂点被覆。60秒なら `miplib_lp4l` も証明 |
| MaxSAT/RC2 | 論理・基数制約、頂点被覆、巨大係数PBSのUNSAT証明。`clique_coloring_n8_t6` と `vertex_cover_grid_dim072` が非常に速い |

## 実行コマンド例

SCIP:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 60 \
  --solver-data /tmp/scip-clique.watcher.log \
  --var /tmp/scip-clique.var \
  ./SCIP/build/pb_scip problems/gurobi_scip/clique_coloring_n8_t6.opb 60
```

Gurobi:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 60 \
  --solver-data /tmp/gurobi-clique.watcher.log \
  --var /tmp/gurobi-clique.var \
  python3 GUROBI/pb_gurobi.py problems/gurobi_scip/clique_coloring_n8_t6.opb 60
```

RoundingSat:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 60 \
  --solver-data /tmp/roundingsat-clique.watcher.log \
  --var /tmp/roundingsat-clique.var \
  RoundingSat/bin/roundingsat --time-limit=60 --print-sol=1 \
  problems/gurobi_scip/clique_coloring_n8_t6.opb
```

MaxSAT/RC2:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 60 \
  --solver-data /tmp/rc2-clique.watcher.log \
  --var /tmp/rc2-clique.var \
  python3 MAXSAT/pb_rc2.py problems/gurobi_scip/clique_coloring_n8_t6.opb 60
```

NaPS:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 60 \
  --solver-data /tmp/naps-clique.watcher.log \
  --var /tmp/naps-clique.var \
  ./naps/naps-1.02b problems/gurobi_scip/clique_coloring_n8_t6.opb
```
