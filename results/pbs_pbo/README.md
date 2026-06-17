# PBS / PBO 特性別比較レポート

実験日: 2026-06-17

PB問題は大きく分けると、判定問題の **PBS** と、最適化問題の **PBO** に分けられます。このレポートでは、既存の10秒・60秒比較結果をPBS/PBOの観点から読み直します。

## PBSとPBO

| 種類 | 意味 | OPB上の見分け方 | ソルバに求められること |
| --- | --- | --- | --- |
| PBS | Pseudo-Boolean Satisfaction | `min:` / `max:` 目的関数がない | 実行可能解を1つ見つける、またはUNSATを証明する |
| PBO | Pseudo-Boolean Optimization | `min:` / `max:` 目的関数がある | 実行可能解を改善し、最適性まで証明する |

PBSは「満たせるか」が中心です。PBOは「どれだけ良い解か」と「それが最適か」の両方が必要なので、一般に証明が重くなります。

## 今回の比較問題の分類

| 問題 | 種類 | 特徴 |
| --- | --- | --- |
| `bitvector_equalities_17arraycomm.opb` | PBS | 巨大係数を含むビットベクトル等式系。数値誤差の観察用 |
| `miplib_air01_dec.opb` | PBS | MIPLIB由来の判定問題 |
| `clique_coloring_n5_t3.opb` | PBO | 小さい論理・基数制約の最適化 |
| `clique_coloring_n8_t6.opb` | PBO | 中規模の論理・基数制約の最適化 |
| `knapsack_subset_sum_200.opb` | PBO | 単一大規模ナップサック |
| `maxcut_5partite_n27.opb` | PBO | MaxCut系の最適化 |
| `miplib_lp4l.opb` | PBO | MIPLIB由来の線形最適化 |
| `vertex_cover_grid_dim072.opb` | PBO | 頂点被覆。論理・基数制約に近い最適化 |

今回のセットはPBOが多めです。PBSについては2問だけなので、強い結論ではなく「このセットでの傾向」として読むのがよいです。

## 追加PBS問題

PBSの比較を増やすため、`normalized-PB24/DEC-LIN` の圧縮ファイルから4問を [problems/pbs_extra](../../problems/pbs_extra) に展開しました。

| 問題 | 変数/制約 | 特徴 |
| --- | --- | --- |
| `vertex_cover_grid6_07_shuf3.opb` | 42変数 / 85制約 | 小さめの頂点被覆系PBS |
| `sumineq_arity5_p005_shuf2.opb` | 105変数 / 22制約 | sumineq系PBS |
| `subsetcard_eq_random4reg_10_shuf3.opb` | 41変数 / 40制約 | subsetcard系PBS |
| `bitvector_12array_alg_ineq10.opb` | 510変数 / 1053制約 | ビットベクトル系PBS。比較的重め |

これでPBS側の比較対象は、既存の `miplib_air01_dec` と `bitvector_equalities_17arraycomm` に加えて、合計6問になります。

## PBSでの傾向

| 問題 | NaPS | SCIP | Gurobi | RoundingSat | MaxSAT/RC2 |
| --- | --- | --- | --- | --- | --- |
| `miplib_air01_dec` | 10秒 UNKNOWN | 0.192秒 SAT | 0.050秒 SAT | 0.015秒 SAT | 10秒 TIMEOUT |
| `bitvector_equalities_17arraycomm` | 10秒 UNKNOWN | SATだが検算で1制約違反 | 0.067秒 UNSAT | 10秒 UNKNOWN | 0.146秒 UNSAT |

PBSでは、目的関数の最適性証明が不要なので、実行可能解または矛盾証明に早く到達できるソルバが有利です。

このセットでは、`miplib_air01_dec` に対してRoundingSat、Gurobi、SCIPが速く、MaxSAT/RC2とNaPSは苦戦しました。`bitvector_equalities_17arraycomm` は巨大係数が絡むため、SCIPの浮動小数点許容誤差の影響が見えています。GurobiとRC2はUNSATを返しました。

## PBOでの傾向

| 問題タイプ | 強かったソルバ | コメント |
| --- | --- | --- |
| 小さい論理・基数最適化 | NaPS, Gurobi, RoundingSat, RC2 | `clique_coloring_n5_t3` は全体的に速い。NaPSも非常に速い |
| 中規模論理・基数最適化 | MaxSAT/RC2, Gurobi | `clique_coloring_n8_t6` はRC2が0.152秒、Gurobiが0.671秒で60秒実験でも強い |
| ナップサック | RoundingSat, Gurobi, SCIP | `knapsack_subset_sum_200` はRoundingSatが0.012秒、Gurobiが0.058秒、SCIPが0.196秒 |
| MaxCut | Gurobi, SCIP | `maxcut_5partite_n27` はGurobiが2.673秒、SCIPが19.653秒で最適性証明 |
| MIPLIB線形最適化 | Gurobi, SCIP | `miplib_lp4l` はGurobi/SCIPが0.1秒前後 |
| 頂点被覆 | MaxSAT/RC2, RoundingSat, NaPS | `vertex_cover_grid_dim072` はRC2、RoundingSat、NaPSが60秒内に証明。SCIP/Gurobiは未証明 |

PBOでは「良い解を見つける力」と「最適性を証明する力」の両方が効きます。たとえばRoundingSatは `maxcut_5partite_n27` で最適値 `-180` の実行可能解を見つけましたが、60秒では最適性証明に届きませんでした。これはPBOらしい差です。

## ソルバ別のPBS/PBO特性

| ソルバ | PBSでの傾向 | PBOでの傾向 |
| --- | --- | --- |
| NaPS | 小さい論理系なら強いが、今回のPBS 2問では苦戦 | 小さい論理・基数最適化は速い。大きめの重み付き最適化やMIPLIB系の証明は苦手 |
| SCIP | MIPLIB由来PBSは速い。巨大係数PBSは数値誤差に注意 | MIPLIB系、ナップサック、MaxCutで強い。頂点被覆系は苦手 |
| Gurobi | MIPLIB由来PBSと巨大係数UNSATに強い | MIP系PBOとMaxCutが非常に強い。頂点被覆は証明で苦戦 |
| RoundingSat | MIPLIB由来PBSは非常に速い | PBネイティブらしくナップサックと頂点被覆が強い。MIPLIB系も60秒なら証明できる場合あり |
| MaxSAT/RC2 | PBSでもUNSAT証明に強い場合があるが、MIPLIB由来PBSは苦手 | 論理・基数制約、頂点被覆が非常に強い。ナップサック、MaxCut、MIPLIB線形最適化は苦手 |

## 使い分けの目安

| 問題の性質 | まず試したいソルバ |
| --- | --- |
| 目的関数なしのMIPLIB由来PBS | RoundingSat, Gurobi, SCIP |
| 巨大係数を含むPBS | Gurobi, MaxSAT/RC2。SCIPは検算必須 |
| 論理・基数制約中心のPBO | MaxSAT/RC2, Gurobi, NaPS |
| ナップサック型PBO | RoundingSat, Gurobi, SCIP |
| MaxCut型PBO | Gurobi, SCIP |
| 頂点被覆型PBO | MaxSAT/RC2, RoundingSat, NaPS |
| MIPLIB由来の線形PBO | Gurobi, SCIP |

## 注意点

SCIPとGurobiは連続値ベースのMIPソルバなので、巨大係数のPBでは数値許容誤差の扱いが重要です。今回の `bitvector_equalities_17arraycomm` では、SCIPがSATとした解を元OPBで検算すると1制約違反していました。

MaxSAT/RC2はOPBをCNF/MaxSATへ変換しているため、PBOの目的関数やPB制約の形によって変換後サイズが大きく変わります。論理・基数制約には強い一方、重い数値係数の問題では不利です。

NaPSやRoundingSatはPBらしい構造を直接扱えますが、PBOでは暫定解を見つけることと最適性証明の難しさが分かれます。`SATISFIABLE / TIMEOUT` は「良い解はあるが、最適とはまだ言えていない」と読むのが自然です。
