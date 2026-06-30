# 比較実験 総合レポート

実験日: 2026-06-17

このディレクトリには、PB/OPBソルバ比較実験の要約レポートをまとめています。個別の実行ログは大きくなりやすいため整理済みで、現在gitに残しているのは要約READMEだけです。

## レポート一覧

| ファイル | 内容 |
| --- | --- |
| [gurobi_scip/README.md](gurobi_scip/README.md) | 5ソルバの10秒比較。NaPS、SCIP、Gurobi、RoundingSat、MaxSAT/RC2 |
| [sixty_sec/README.md](sixty_sec/README.md) | 10秒比較対象を60秒で再測定した比較 |
| [pbs_pbo/README.md](pbs_pbo/README.md) | PBS/PBOという問題種別で見た比較 |
| [naps_fastest/README.md](naps_fastest/README.md) | NaPSが5ソルバ中で最速になる例 |
| [rankings/README.md](rankings/README.md) | 各問題ごとの1位から5位の順位表 |
| [rankings/rankings.csv](rankings/rankings.csv) | 順位表のCSVデータ |
| [gurobi_scip/problems.txt](gurobi_scip/problems.txt) | 以前の比較対象問題リスト |

## 比較したソルバ

| ソルバ | コマンド入口 | 特徴 |
| --- | --- | --- |
| NaPS | `./naps/naps-1.02b` | PB専用。SAT符号化・BDD寄り。小さい論理/基数制約で速い |
| SCIP | `./SCIP/build/pb_scip` | MIPソルバを使う自作C++ラッパー。MIPLIB系や線形最適化に強い |
| Gurobi | `python3 GUROBI/pb_gurobi.py` | 商用MIPソルバ。MaxCutやMIP系で強い。WLSライセンスが必要 |
| RoundingSat | `RoundingSat/bin/roundingsat` | PBネイティブ。ナップサックや頂点被覆に強い |
| MaxSAT/RC2 | `python3 MAXSAT/pb_rc2.py` | OPBをMaxSATへ変換してPySAT RC2で解く。論理/基数制約や頂点被覆に強い |

## 全体の結論

**NaPS**

小さめの論理・基数制約型PBOで速いです。`clique_coloring_n5_t3` では5ソルバ中最速でした。一方、大きめの重み付きPBOやMIPLIB系では証明が重くなりがちです。

**SCIP**

MIPLIB由来の線形問題やナップサック、MaxCutで安定して強いです。60秒に伸ばすと、10秒では未証明だった `clique_coloring_n8_t6` と `maxcut_5partite_n27` も最適性証明できました。ただし巨大係数PBSでは数値許容誤差に注意が必要です。

**Gurobi**

MIP系PBOとMaxCutで非常に強いです。`maxcut_5partite_n27` は5ソルバ中で最も明確に強く、2.673秒で最適性証明しました。WLSライセンス認証とPython起動のオーバーヘッドがあるため、極小問題では相対的に不利に見えることがあります。

**RoundingSat**

PBネイティブ系らしく、ナップサックと頂点被覆で強いです。`knapsack_subset_sum_200` は0.012秒で最適性証明しました。PBOでは良い解を見つけても最適性証明に時間がかかる場合があります。

**MaxSAT/RC2**

論理・基数制約や頂点被覆で非常に強いです。`clique_coloring_n8_t6` は0.152秒、`vertex_cover_grid_dim072` は1.167秒で最適性証明しました。一方、ナップサック、MaxCut、MIPLIB線形最適化では変換後の問題が重くなり苦戦します。

## 代表的な結果

| 問題 | 強かったソルバ | 結果 |
| --- | --- | --- |
| `clique_coloring_n5_t3` | NaPS | 0.015秒で最適値2 |
| `clique_coloring_n8_t6` | MaxSAT/RC2 | 0.152秒で最適値2 |
| `knapsack_subset_sum_200` | RoundingSat | 0.012秒で最適値-48992 |
| `maxcut_5partite_n27` | Gurobi | 2.673秒で最適値-180 |
| `miplib_lp4l` | Gurobi / SCIP | 0.1秒前後で最適値2967 |
| `vertex_cover_grid_dim072` | MaxSAT/RC2 | 1.167秒で最適値2664 |
| `miplib_air01_dec` | RoundingSat | 0.017秒でSAT |

## 残っているログ

現在 `results/` 以下に残しているのは要約レポートだけです。

```text
results/gurobi_scip/README.md
results/gurobi_scip/problems.txt
results/sixty_sec/README.md
results/pbs_pbo/README.md
results/naps_fastest/README.md
results/rankings/README.md
results/rankings/rankings.csv
results/README.md
```

個別実行時に生成される以下のファイルは整理済みで、gitでは追跡しない設定にしています。

| ファイル | 内容 |
| --- | --- |
| `*.watcher.log` | runsolverの `--solver-data` 出力。ソルバ本体の `c/o/s/v` 行が入る |
| `*.var` | runsolverの `--var` 出力。`WCTIME`、`CPUTIME`、`TIMEOUT` などが入る |
| `*.log` | runsolver自身の監視ログ。コマンドライン、プロセス情報、メモリ情報など |

## ログの見方

ソルバ本体の結果を見るなら、まず `*.watcher.log` を見ます。

```bash
grep -E '^(o |s |v )' some.watcher.log
```

PBソルバ競技風の意味は次の通りです。

| 行 | 意味 |
| --- | --- |
| `o <value>` | 暫定解または最終解の目的値 |
| `s OPTIMUM FOUND` | 最適性まで証明済み |
| `s SATISFIABLE` | 実行可能解あり。PBOでは最適性未証明の場合がある |
| `s UNSATISFIABLE` | 制約を満たす解が存在しない |
| `s UNKNOWN` | 時間切れなどで不明 |
| `v ...` | 変数割当 |

実行時間を見るなら `*.var` を見ます。

```bash
grep -E '^(WCTIME|CPUTIME|TIMEOUT)=' some.var
```

重要なのは主に次です。

| 変数 | 意味 |
| --- | --- |
| `WCTIME` | 壁時計時間。比較表ではこれを採用 |
| `CPUTIME` | CPU時間 |
| `TIMEOUT` | runsolverの制限で止まったか |

注意点として、runsolverがタイムアウトでプロセスを止めると、最終 `s` 行や `v` 行が残らないことがあります。その場合は最後の `o` 行を暫定値として扱いました。

## 基本の実行コマンド

以下はPBSolverディレクトリ直下から実行します。

### NaPS

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/naps.watcher.log \
  --var /tmp/naps.var \
  ./naps/naps-1.02b problems/gurobi_scip/clique_coloring_n5_t3.opb
```

### SCIP

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/scip.watcher.log \
  --var /tmp/scip.var \
  ./SCIP/build/pb_scip problems/gurobi_scip/clique_coloring_n5_t3.opb 10
```

### Gurobi

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/gurobi.watcher.log \
  --var /tmp/gurobi.var \
  python3 GUROBI/pb_gurobi.py problems/gurobi_scip/clique_coloring_n5_t3.opb 10
```

GurobiはWLSライセンス認証を行います。`~/.gurobi/gurobi.lic` が必要です。

### RoundingSat

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/roundingsat.watcher.log \
  --var /tmp/roundingsat.var \
  RoundingSat/bin/roundingsat --time-limit=10 --print-sol=1 \
  problems/gurobi_scip/clique_coloring_n5_t3.opb
```

### MaxSAT/RC2

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/rc2.watcher.log \
  --var /tmp/rc2.var \
  python3 MAXSAT/pb_rc2.py problems/gurobi_scip/clique_coloring_n5_t3.opb 10
```

RC2ラッパーはPBSと `min:` PBOに対応しています。`max:` 目的関数は未対応です。

## 一括実験の例

個別ログを保存したい場合は、`results/run/<solver>/` のような一時ディレクトリに出します。これらのログはgitignore対象です。

```bash
mkdir -p results/run/scip
for problem in problems/gurobi_scip/*.opb; do
  name=$(basename "$problem" .opb)
  ./runsolver/src/runsolver \
    --wall-clock-limit 10 \
    --solver-data "results/run/scip/${name}.watcher.log" \
    --var "results/run/scip/${name}.var" \
    ./SCIP/build/pb_scip "$problem" 10 \
    > "results/run/scip/${name}.log" 2>&1
done
```

他ソルバも最後のコマンド部分を差し替えれば同じ形で実行できます。

## 検算について

比較中、ソルバが出した `v` 行を元OPBで評価して、目的値と制約充足を確認しました。特に `bitvector_equalities_17arraycomm` では、SCIPが `SATISFIABLE` とした解が元OPBの1制約に違反していました。

そのため、巨大係数を含むPBでは、ソルバの `s` 行だけでなく `v` 行の検算も重要です。
