# PBProblemStudy-B1ueDR4G0N

Pseudo-Boolean (PB/OPB) 問題を、複数のソルバで比較するための実験フォルダです。

公開時の外部ソフトウェア・ライセンス・ベンチマークデータの扱いは [THIRD_PARTY.md](THIRD_PARTY.md) にまとめています。このリポジトリは自作ラッパー、実験メモ、比較レポートを中心に置き、外部ソルバ本体や商用ライセンス情報は含めない方針です。

外部依存の初期セットアップは、次のスクリプトでまとめて実行できます。

```bash
scripts/init_third_party.sh
```

このスクリプトは、SCIP/SoPlex submodule、Python依存、runsolverのビルド、RoundingSatのcloneを行います。GurobiライセンスとNaPSバイナリは利用者自身で取得・配置してください。

このリポジトリでは次の5ソルバを扱います。

| ソルバ | 位置づけ | 実行ファイル/入口 |
| --- | --- | --- |
| NaPS | PB専用。SAT符号化・BDD系のPBソルバ | 各自で入手して `naps/naps-1.02b` に配置 |
| SCIP | MIPソルバ。自作OPB読み込みラッパー | submoduleからSCIP/SoPlexを用意し `SCIP/build/pb_scip` をビルド |
| Gurobi | 商用MIPソルバ。WLSライセンス使用 | `GUROBI/pb_gurobi.py` |
| RoundingSat | PBネイティブの切除平面/CDCL系ソルバ | 各自でclone/buildして `RoundingSat/bin/roundingsat` を用意 |
| MaxSAT/RC2 | OPBをMaxSATへ変換してPySAT RC2で解く | `MAXSAT/pb_rc2.py` |

## 比較用問題

外部ベンチマーク由来の `.opb` 本体は、再配布条件をこのリポジトリ側で保証できないためGitでは追跡しません。
比較レポートには問題名と結果を残していますが、再現する場合は元の配布元から利用者自身で取得してください。
本実験で使った問題は、主に [Pseudo-Boolean Competition 2025](https://www.cril.univ-artois.fr/PB25/) の **Benchmarks available in the PB24 format** にある `normalized-PB24.tar` から取り出したものです。
ダウンロード後、ローカルで `normalized-PB24/` などに展開し、必要な `.opb` / `.opb.xz` を `problems/` 以下へ配置して使います。

公開リポジトリに含める動作確認用OPBは [problems/sample](problems/sample) の自作サンプルだけです。

| 問題 | 種類 | 特徴 |
| --- | --- | --- |
| `sample_pbs.opb` | PBS | 3変数3制約の充足可能性判定 |
| `sample_pbo.opb` | PBO | 3変数2制約の小さな最適化。最適値 `-5` |

過去の比較で使った主な問題名は次の通りです。

| 問題 | 特徴 |
| --- | --- |
| `clique_coloring_n5_t3.opb` | 小さめの論理・基数制約。多くのソルバが速い |
| `clique_coloring_n8_t6.opb` | 密な論理・基数制約。MaxSAT/RC2とGurobiが強い |
| `knapsack_subset_sum_200.opb` | 単一大規模ナップサック。RoundingSat、Gurobi、SCIPが強い |
| `maxcut_5partite_n27.opb` | MaxCut系。Gurobiが最適性証明まで速い |
| `miplib_air01_dec.opb` | MIPLIB由来の判定問題。MIP系とRoundingSatが速い |
| `miplib_lp4l.opb` | MIPLIB由来の最適化。SCIP/Gurobiが強い |
| `vertex_cover_grid_dim072.opb` | グリッド頂点被覆。RoundingSat/RC2が強い |
| `bitvector_equalities_17arraycomm.opb` | 巨大係数あり。数値誤差の観察用で、性能比較本命からは外す |

追加のPBS比較問題の出典メモは [problems/pbs_extra](problems/pbs_extra) にあります。圧縮済みPB24 DEC-LINから、頂点被覆、sumineq、subsetcard、bitvector系を1問ずつ使いました。

## 60秒比較の要約

実験日: 2026-06-17  
制限: `runsolver --wall-clock-limit 60`、各ソルバ内部制限も可能な範囲で60秒。

10秒実験では、問題によっては「暫定解は出ているが最適性証明までは届かない」ケースが多く、ソルバの得意不得意を見るにはやや短すぎました。
そのため、README冒頭では60秒実験の結果を中心にまとめます。
10秒の全体表や細かい順位は [results/rankings/README.md](results/rankings/README.md) と [results/gurobi_scip/README.md](results/gurobi_scip/README.md) に残しています。

| 問題 | NaPS | SCIP | Gurobi | RoundingSat | MaxSAT/RC2 |
| --- | --- | --- | --- | --- | --- |
| `bitvector_equalities_17arraycomm` | UNKNOWN | SATだが検算NG | UNSAT, 0.491s | UNSAT, 10.243s | UNSAT, 0.168s |
| `clique_coloring_n5_t3` | OPT 2, 0.015s | OPT 2, 0.105s | OPT 2, 0.064s | OPT 2, 0.098s | OPT 2, 0.082s |
| `clique_coloring_n8_t6` | SAT/TIMEOUT, inc 3 | OPT 2, 21.258s | OPT 2, 0.671s | SAT/TIMEOUT, inc 2 | OPT 2, 0.152s |
| `knapsack_subset_sum_200` | SAT/TIMEOUT, inc -48932 | OPT -48992, 0.142s | OPT -48992, 0.061s | OPT -48992, 0.012s | TIMEOUT |
| `maxcut_5partite_n27` | SAT/TIMEOUT, inc -176 | OPT -180, 19.653s | OPT -180, 2.673s | SAT/TIMEOUT, inc -180 | TIMEOUT |
| `miplib_air01_dec` | SAT, 16.549s | SAT, 0.205s | SAT, 0.047s | SAT, 0.017s | TIMEOUT |
| `miplib_lp4l` | SAT/TIMEOUT, inc 4499 | OPT 2967, 0.119s | OPT 2967, 0.104s | OPT 2967, 17.965s | TIMEOUT |
| `vertex_cover_grid_dim072` | OPT 2664, 9.503s | TIMEOUT, inc 2664 | TIMEOUT, inc 2664 | OPT 2664, 7.068s | OPT 2664, 1.167s |

`inc` は暫定値です。`SAT/TIMEOUT` は実行可能解は出たが最適性証明までは終わっていない、という意味で読んでください。
`bitvector_equalities_17arraycomm` のSCIP結果は、ソルバ出力上はSATですが元OPB検算で制約違反があるため、性能比較の勝ちとしては扱いません。
60秒実験の詳細は [results/sixty_sec/README.md](results/sixty_sec/README.md) にまとめています。

## 得意分野まとめ

PBS/PBOという問題種別で見た詳しい比較は [results/pbs_pbo/README.md](results/pbs_pbo/README.md) にまとめています。

**NaPS**

小さい論理・基数制約では速く、10秒実験の `clique_coloring_n5_t3` は最速級でした。
60秒実験では `vertex_cover_grid_dim072` を9.503秒で最適性証明しており、頂点被覆のようなPB/MaxSAT寄り構造でも強さが出ます。
`miplib_air01_dec` も60秒ならSATに到達しました。一方、MIPLIB系PBOやMaxCutでは暫定解止まりになりやすいです。

**SCIP**

MIPとして自然な線形最適化が得意です。
60秒実験では `miplib_lp4l` を0.119秒、`maxcut_5partite_n27` を19.653秒、`clique_coloring_n8_t6` を21.258秒で最適性証明しました。
`knapsack_subset_sum_200` や `miplib_air01_dec` も安定して速いです。ただし `vertex_cover_grid_dim072` は60秒でも証明できず、巨大係数を含むPBSでは数値許容誤差にも注意が必要です。

**Gurobi**

MIP系PBOとMaxCutで非常に強いです。
60秒実験では `miplib_lp4l` を0.104秒、`maxcut_5partite_n27` を2.673秒で最適性証明し、MaxCutでは5ソルバ中で最も明確に強く出ました。
`knapsack_subset_sum_200`、`miplib_air01_dec`、`clique_coloring_n8_t6` も速いです。WLSライセンスとネットワーク認証が必要です。

**RoundingSat**

PBネイティブらしく、ナップサックや頂点被覆で強いです。
60秒実験では `vertex_cover_grid_dim072` を7.068秒で証明し、`miplib_lp4l` も17.965秒で証明しました。
`knapsack_subset_sum_200` は0.012秒、`miplib_air01_dec` は0.017秒で解けており、PBネイティブ系としての強さがかなりはっきり出ます。`maxcut_5partite_n27` では最適値らしい暫定解 `-180` まで到達しましたが、60秒では最適性証明に届きませんでした。

**MaxSAT/RC2**

PBをMaxSATへ変換して解くため、論理・基数制約や頂点被覆系で鋭く効きます。
60秒実験では `clique_coloring_n8_t6` を0.152秒、`vertex_cover_grid_dim072` を1.167秒で最適性証明し、この2系統では最速でした。
`bitvector_equalities_17arraycomm` のUNSAT証明も0.168秒で速いです。一方でナップサック、MaxCut、MIPLIB系の大きな重み付き線形制約は苦手です。

## 実行コマンド

以下はPBSolverディレクトリ直下から実行します。
NaPS、SCIP、RoundingSatの実行ファイルは公開リポジトリには含めず、ローカルで導入・ビルドして使います。

### NaPS

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data naps-solver.log \
  --var naps-result.var \
  ./naps/naps-1.02b problems/sample/sample_pbo.opb
```

### SCIP

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data scip-solver.log \
  --var scip-result.var \
  ./SCIP/build/pb_scip problems/sample/sample_pbo.opb 10
```

### Gurobi

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data gurobi-solver.log \
  --var gurobi-result.var \
  python3 GUROBI/pb_gurobi.py problems/sample/sample_pbo.opb 10
```

Gurobi WLSライセンスは `~/.gurobi/gurobi.lic` を使います。`GUROBI/pb_gurobi.py` はこのライセンスファイルを自動で `GRB_LICENSE_FILE` に設定します。

### RoundingSat

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data roundingsat-solver.log \
  --var roundingsat-result.var \
  RoundingSat/bin/roundingsat --time-limit=10 --print-sol=1 \
  problems/sample/sample_pbo.opb
```

### MaxSAT/RC2

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data rc2-solver.log \
  --var rc2-result.var \
  python3 MAXSAT/pb_rc2.py problems/sample/sample_pbo.opb 10
```

RC2は `min:` 目的関数のみ対応しています。OPBの制約はCNFへエンコードし、目的関数は重み付きソフト節へ変換します。

## ラッパープログラムのPBS/PBO対応

| プログラム | PBS | PBO | 備考 |
| --- | --- | --- | --- |
| `SCIP/pb_scip.cpp` | 対応 | 対応 | `min:` / `max:` の両方に対応。目的関数がなければSAT/UNSAT判定 |
| `GUROBI/pb_gurobi.py` | 対応 | 対応 | `min:` / `max:` の両方に対応。WLSライセンスが必要 |
| `MAXSAT/pb_rc2.py` | 対応 | 一部対応 | PBSと `min:` PBOに対応。`max:` PBOは未対応 |

NaPSとRoundingSatは外部ソルバ本体なので、正規化された線形OPBであればPBS/PBOの両方を直接扱えます。

## 一括実験

個別ログを残したい場合は、例えば次のようにします。

```bash
mkdir -p results/run/scip
for problem in problems/sample/*.opb; do
  name=$(basename "$problem" .opb)
  ./runsolver/src/runsolver \
    --wall-clock-limit 10 \
    --solver-data "results/run/scip/${name}.watcher.log" \
    --var "results/run/scip/${name}.var" \
    ./SCIP/build/pb_scip "$problem" 10 \
    > "results/run/scip/${name}.log" 2>&1
done
```

ソルバ部分を差し替えれば、同じ形で他のソルバも測れます。詳細ログは大きくなりやすいので、gitでは追跡しない設定にしています。

## ディレクトリ

| パス | 内容 |
| --- | --- |
| `problems/sample/` | 公開用の自作PBS/PBOサンプル |
| `problems/gurobi_scip/` | 5ソルバ比較で使った外部ベンチマーク問題名と実行メモ |
| `problems/pbs_extra/` | 圧縮ファイルから追加したPBS比較問題の出典メモ |
| `SCIP/` | SCIPラッパー、CMake設定、SCIP/SoPlex submodule。`build/` と `local/` はローカル生成物 |
| `GUROBI/` | Gurobi Pythonラッパー |
| `MAXSAT/` | PySAT RC2 MaxSATラッパー |
| `RoundingSat/` | ローカルにcloneするRoundingSat本体。Git追跡対象外 |
| `naps/` | ローカルに置くNaPS実行ファイル。Git追跡対象外 |
| `runsolver/src/` | 時間制限・計測用ランナーのソース。実行ファイルはローカルでmake |

## 補足

実験全体の見方、ログの読み方、再実行コマンドは [results/README.md](results/README.md) にまとめています。最新の要約レポートは [results/gurobi_scip/README.md](results/gurobi_scip/README.md) にもあります。60秒で差が出やすい問題に絞った追加レポートは [results/sixty_sec/README.md](results/sixty_sec/README.md)、PBS/PBO特性別の追加レポートは [results/pbs_pbo/README.md](results/pbs_pbo/README.md)、NaPSが最速になる例は [results/naps_fastest/README.md](results/naps_fastest/README.md)、問題別順位表は [results/rankings/README.md](results/rankings/README.md) です。個別ログは整理済みです。
