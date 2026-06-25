# PB Problems

公開リポジトリでは、外部ベンチマーク由来のOPB問題は再配布しません。
Gitで追跡する `.opb` は [sample](sample) の自作サンプルだけです。

過去の比較実験で使った問題名や結果は `results/` 以下のレポートに残しています。
再現したい場合は、PB競技ベンチマークや各ソルバ付属のテスト問題など、元の配布元から利用者自身で取得してください。
本実験では、主に [Pseudo-Boolean Competition 2025](https://www.cril.univ-artois.fr/PB25/) の **Benchmarks available in the PB24 format** にある `normalized-PB24.tar` を使いました。

## 実行方法

PBSolverディレクトリから実行してください。

```bash
./naps/naps-1.02b problems/sample/sample_pbs.opb
./naps/naps-1.02b problems/sample/sample_pbo.opb
```

モデル（変数の割り当て）を表示しない場合は、末尾に `-nm` を付けます。

```bash
./naps/naps-1.02b problems/sample/sample_pbo.opb -nm
```

## 問題一覧

| ファイル | 期待結果 | 実測時間 |
| --- | --- | ---: |
| `sample/sample_pbs.opb` | `SATISFIABLE` | 極小 |
| `sample/sample_pbo.opb` | `OPTIMUM FOUND`、最適値 `-5` | 極小 |

実測時間はソルバや環境で変わります。

## 時間制限付き実行

以下は10秒で打ち切る例です。

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data solver.log \
  --var result.var \
  ./naps/naps-1.02b problems/sample/sample_pbo.opb
```
