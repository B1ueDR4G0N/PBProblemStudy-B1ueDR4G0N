# NaPSが最速になる例

実験日: 2026-06-17

5ソルバの中でNaPSが一番早くなる代表例として、`clique_coloring_n5_t3.opb` を同じ10秒制限で実行しました。

## 対象問題

`problems/gurobi_scip/clique_coloring_n5_t3.opb`

- 種類: PBO
- 特徴: 小さめの論理・基数制約系
- 期待される得意ソルバ: SAT/PB符号化系、MaxSAT系

## 結果

| solver | status | objective | wall time | timeout |
| --- | --- | ---: | ---: | --- |
| NaPS | OPTIMUM FOUND | 2 | 0.0161791 | false |
| MaxSAT/RC2 | OPTIMUM FOUND | 2 | 0.081576 | false |
| RoundingSat | OPTIMUM FOUND | 2 | 0.092394 | false |
| SCIP | OPTIMUM FOUND | 2 | 0.106069 | false |
| Gurobi | OPTIMUM FOUND | 2 | 0.523967 | false |

この問題では、5ソルバすべてが最適値 `2` を証明しました。その中でNaPSが最速です。

## 読み方

この問題は小規模な論理・基数制約型PBOです。NaPSのようなPB専用/SAT符号化寄りのソルバが得意にしやすい形です。

Gurobiの時間はWLSライセンス認証とPython起動のオーバーヘッドも含むため、極小問題では不利に見えます。ただし同じ `runsolver` 条件で「コマンドとして起動して解き終わるまで」の比較としては、この表の通りです。

## 実行コマンド例

NaPS:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/naps-fast.watcher.log \
  --var /tmp/naps-fast.var \
  ./naps/naps-1.02b problems/gurobi_scip/clique_coloring_n5_t3.opb
```

SCIP:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/scip-fast.watcher.log \
  --var /tmp/scip-fast.var \
  ./SCIP/build/pb_scip problems/gurobi_scip/clique_coloring_n5_t3.opb 10
```

Gurobi:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/gurobi-fast.watcher.log \
  --var /tmp/gurobi-fast.var \
  python3 GUROBI/pb_gurobi.py problems/gurobi_scip/clique_coloring_n5_t3.opb 10
```

RoundingSat:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/roundingsat-fast.watcher.log \
  --var /tmp/roundingsat-fast.var \
  RoundingSat/bin/roundingsat --time-limit=10 --print-sol=1 \
  problems/gurobi_scip/clique_coloring_n5_t3.opb
```

MaxSAT/RC2:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/rc2-fast.watcher.log \
  --var /tmp/rc2-fast.var \
  python3 MAXSAT/pb_rc2.py problems/gurobi_scip/clique_coloring_n5_t3.opb 10
```
