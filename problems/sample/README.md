# 自作OPBサンプル

このディレクトリの `.opb` は、このリポジトリ用に新しく作った極小サンプルです。
外部ベンチマーク由来ではないため、公開リポジトリに含めています。

| ファイル | 種類 | 内容 | 期待される結果 |
| --- | --- | --- | --- |
| `sample_pbs.opb` | PBS | 3変数3制約の充足可能性判定 | SATISFIABLE |
| `sample_pbo.opb` | PBO | 3変数2制約の小さな選択問題 | OPTIMUM FOUND、最適値 `-5` |

実行例:

```bash
./SCIP/build/pb_scip problems/sample/sample_pbs.opb 10
./SCIP/build/pb_scip problems/sample/sample_pbo.opb 10
```

NaPS、Gurobi、RoundingSat、MaxSAT/RC2でも、各ソルバの導入後に同じファイルを使って動作確認できます。
