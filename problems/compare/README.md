# SCIP / NaPS 比較用問題

同じ環境で、SCIPとNaPSの得意領域の違いを確認しやすい2問です。
実測時間には `runsolver` 自体の起動時間も含まれます。

## 1. SCIP向き: bitvector equalities

`scip_favored_bitvector_equalities.opb`

- 1768変数、936制約、うち935本が等式
- 大きな係数を含む線形等式が中心
- SCIPは線形制約のプリソルブと伝播で解ける
- NaPSはPB制約からSATへの変換に時間がかかる

実測結果:

| ソルバ | 10秒制限での結果 | 実測時間 |
| --- | --- | ---: |
| SCIP | `OPTIMAL` | 約0.04秒 |
| NaPS | `UNKNOWN` | 10秒でタイムアウト |

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data scip-bitvector.log \
  --var scip-bitvector.var \
  ./SCIP/build/pb_scip problems/compare/scip_favored_bitvector_equalities.opb 10

./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data naps-bitvector.log \
  --var naps-bitvector.var \
  ./naps/naps-1.02b problems/compare/scip_favored_bitvector_equalities.opb -v0 -nm
```

## 2. NaPS向き: clique coloring

`naps_favored_clique_coloring.opb`

- 55変数、245制約
- 小さい係数による密な論理・基数制約が中心
- NaPSはSAT変換とSAT探索を効率よく利用できる
- SCIPも解けるが、起動・プリソルブ・LP処理の負担が相対的に大きい

5回実測した平均時間:

| ソルバ | 結果 | 平均時間 |
| --- | --- | ---: |
| NaPS | `OPTIMUM FOUND`、目的値 `2` | 約0.018秒 |
| SCIP | `OPTIMAL`、目的値 `2` | 約0.126秒 |

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data naps-clique.log \
  --var naps-clique.var \
  ./naps/naps-1.02b problems/compare/naps_favored_clique_coloring.opb -v0 -nm

./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data scip-clique.log \
  --var scip-clique.var \
  ./SCIP/build/pb_scip problems/compare/naps_favored_clique_coloring.opb 10
```
