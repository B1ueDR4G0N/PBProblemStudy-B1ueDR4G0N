# サードパーティソフトウェアとデータの扱い

このリポジトリは、Pseudo-Boolean (PB/OPB) ソルバ比較実験のために作成した自作ラッパー、実験メモ、比較レポートを公開するものです。

外部ソルバ本体、商用ライセンス、巨大な元ベンチマーク一式を自分の成果物として再配布することは目的としていません。利用者は、各ソフトウェア・データセットの配布元から入手し、それぞれのライセンスや利用規約に従ってください。

## このリポジトリに含めるもの

| パス | 内容 |
| --- | --- |
| `SCIP/pb_scip.cpp` | SCIPを使ってOPBを解く自作C++ラッパー |
| `GUROBI/pb_gurobi.py` | Gurobiを使ってOPBを解く自作Pythonラッパー |
| `MAXSAT/pb_rc2.py` | PySAT/RC2へOPBを変換して解く自作Pythonラッパー |
| `README.md`, `Usage.md`, `results/**/README.md` | 実験メモ、使い方、比較レポート |
| `LOG/` | 代表的な実行ログ。Gurobiのライセンス識別情報は伏せています |
| `problems/` の一部 `.opb` | 比較レポート再現用に抜き出した小さな問題 |

## 利用者が別途入手するもの

### まとめて初期セットアップする場合

利用者は、まず次のスクリプトを実行すると、許可された範囲の初期セットアップをまとめて行えます。

```bash
scripts/init_third_party.sh
```

このスクリプトが行うこと:

| 処理 | 内容 |
| --- | --- |
| SCIP / SoPlex | Git submoduleを取得 |
| Python依存 | `gurobipy` と `python-sat[pblib,aiger]` をユーザー領域へ導入 |
| runsolver | `runsolver/src` で `make` |
| RoundingSat | `https://gitlab.com/MIAOresearch/software/roundingsat.git` からclone |

このスクリプトが行わないこと:

| 処理 | 理由 |
| --- | --- |
| Gurobiライセンス取得 | 利用者個人の商用/アカデミックライセンスが必要なため |
| NaPSバイナリ取得 | 再配布条件をこのリポジトリ側で保証できないため |
| `sudo apt install` など | OSごとの管理者権限が必要なため |
| SCIP本体の完全ビルド/インストール | 環境差が大きいため。`SCIP/local` を用意した後、`--build-scip-wrapper` でラッパーだけビルド可能 |

オプション例:

```bash
scripts/init_third_party.sh --skip-python
scripts/init_third_party.sh --skip-roundingsat
scripts/init_third_party.sh --build-scip-wrapper
```

### SCIP / SoPlex

SCIPとSoPlexはMIPソルバおよびLPソルバです。このリポジトリでは、ソース本体をGit submoduleとして参照します。

取得:

```bash
git submodule update --init --recursive
```

参照先:

```text
SCIP:   https://github.com/scipopt/scip.git
SoPlex: https://github.com/scipopt/soplex.git
```

このリポジトリでは、以下はGitで追跡しません。

```text
SCIP/build/
SCIP/local/
```

これらは利用者の環境でビルド・インストールして作成してください。

SCIPラッパーのビルド例:

```bash
cmake -S SCIP -B SCIP/build -DCMAKE_BUILD_TYPE=Release
cmake --build SCIP/build -j
```

submoduleを使わず、配布元から直接cloneして導入する場合も、最終的に `SCIP/local` を作れば同じように使えます。
実際にこの環境で行った流れは次です。

1. `SCIP/vendor/soplex` にSoPlexをcloneする
2. SoPlexを `SCIP/vendor/soplex-build` でビルドする
3. SoPlexを `SCIP/local` にインストールする
4. `SCIP/vendor/scip` にSCIPをcloneする
5. `SOPLEX_DIR=SCIP/local/lib/cmake/soplex` を指定してSCIPをビルドする
6. SCIPを `SCIP/local` にインストールする
7. `SCIP/build` で `pb_scip` ラッパーをビルドする

詳しいコマンドは [SCIP/README.md](SCIP/README.md) の「submoduleに頼らない手動導入」を参照してください。

SCIP/SoPlexの利用条件は、必ず配布元のライセンスとドキュメントを確認してください。

### Gurobi

Gurobiは商用MIPソルバです。このリポジトリにはGurobi本体、ライセンスファイル、WLS秘密情報を含めません。

Python APIの導入例:

```bash
python3 -m pip install --user gurobipy
```

WLSライセンスファイルは、利用者自身のものをローカルに配置してください。

```text
~/.gurobi/gurobi.lic
```

絶対にコミットしないもの:

```text
gurobi.lic
WLSAccessID
WLSSecret
LicenseID
Gurobi token
```

Gurobiの利用条件は、Gurobi社のライセンス規約に従ってください。

### RoundingSat

RoundingSatはPBネイティブのソルバです。このリポジトリには本体を含めません。

取得例:

```bash
git clone https://gitlab.com/MIAOresearch/software/roundingsat.git RoundingSat
```

実験コマンドでは、次の位置に実行ファイルがある前提にしています。

```text
RoundingSat/bin/roundingsat
```

ビルド方法と利用条件は、RoundingSat配布元のREADMEとライセンスを確認してください。

### NaPS

NaPSはPB専用ソルバです。このリポジトリには `naps/naps-1.02b` バイナリを含めません。再配布条件をこのリポジトリ側で確認・保証できないためです。

利用者は、NaPSの配布元から入手し、利用が許可されている場合にローカルへ配置してください。

この実験では、次の位置に実行ファイルがある前提にしています。

```text
naps/naps-1.02b
```

### runsolver

runsolverは、ソルバの実行時間や終了状態を監視するためのツールです。このリポジトリにはソースと上流のGPLライセンス表示を残しています。

確認すべきファイル:

```text
runsolver/src/LICENSE-GPL-3.0.txt
runsolver/src/README
```

ビルド成果物はGitで追跡しません。

```text
runsolver/src/runsolver
runsolver/src/*.o
runsolver/src/*.d
```

ビルド例:

```bash
cd runsolver/src
make
```

必要な環境は [Usage.md](Usage.md) にまとめています。

### PySAT / RC2

MaxSAT/RC2用ラッパーは、PythonパッケージのPySATを利用します。PySAT本体はこのリポジトリには含めません。

導入例:

```bash
python3 -m pip install --user python-sat[pblib,aiger]
```

PySATおよび同梱・依存ライブラリの利用条件は、Pythonパッケージ側のライセンスを確認してください。

## ベンチマークデータについて

`problems/` 以下の `.opb` ファイルは、比較レポートを再現しやすくするために抜き出した小さな問題です。特に明記がない限り、このプロジェクトが問題そのものを作成したわけではありません。

元データの再配布条件が不明な場合や、より安全に公開したい場合は、`.opb` ファイルもGitから外し、READMEに「どこからダウンロードし、どの問題を展開するか」だけを書く方針にしてください。

## Gitで追跡しないもの

次のファイルやディレクトリは、外部ソフト本体、ビルド成果物、ライセンス情報、大きな元データであるためGitで追跡しません。

```text
SCIP/build/
SCIP/local/
RoundingSat/
naps/naps-1.02b
runsolver/src/runsolver
runsolver/src/*.o
runsolver/src/*.d
gurobi.lic
normalized-PB24/
normalized-*.opb*
*:Zone.Identifier
```

ローカル作業ディレクトリには存在していても構いませんが、公開リポジトリにpushしないようにします。

## 公開前チェック

公開前に、外部バイナリや秘密情報がGitに入っていないか確認します。

```bash
git status --short --ignored
git ls-files | grep -E '(^SCIP/(build|local)/|^RoundingSat/|^naps/naps-1.02b$|^runsolver/src/runsolver$|gurobi\.lic$|:Zone\.Identifier$)'
grep -RInE 'WLSSecret|WLSAccessID|LicenseID to value [0-9]|token\.gurobi|gurobi\.lic|API Key|PASSWORD|SECRET' .
```

1つ目の `grep` は、追跡されてはいけないファイルが残っていないかを見るためのものです。何も出ないのが理想です。

2つ目の `grep` は、秘密情報の混入確認です。READMEなどの注意書きが引っかかることはありますが、実際のキー、トークン、ライセンスID、個人情報が出ないことを確認してください。
