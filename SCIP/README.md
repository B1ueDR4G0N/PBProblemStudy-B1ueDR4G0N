# SCIP PB Solver

SCIPを使って、正規化された線形OPB問題を解く小さなC++プログラムです。

このプログラムは次の形式に対応します。

- 0-1変数
- `min:` / `max:` 目的関数
- `>=`、`<=`、`=` の線形制約
- 正負の整数係数
- `x1` および `~x1` 形式のリテラル

変数同士の積を含む非線形OPBには対応していません。

## SCIP/SoPlexの用意

SCIP本体とSoPlexは、このリポジトリではGit submoduleとして参照します。
ビルド済みの `SCIP/local/` や `SCIP/build/` はローカル生成物なので、Gitでは追跡しません。

初回取得:

```bash
git submodule update --init --recursive
```

この環境では次の組み合わせで動作確認しました。

- SCIP 9.2.4
- SoPlex 7.1.6
- ローカルインストール先: `SCIP/local`

`SCIP/local` を用意した後、バージョンを確認するには、PBSolverディレクトリから次を実行します。

```bash
./SCIP/local/bin/scip --version
```

## submoduleに頼らない手動導入

submoduleを使わず、配布元から直接cloneして同じ配置を作ることもできます。
実際にこの環境では、SoPlexを先に `SCIP/local` へインストールし、その後SCIPを同じ `SCIP/local` へインストールする流れで確認しました。

前提パッケージの例:

```bash
# Ubuntu / Debian / WSL
sudo apt update
sudo apt install build-essential cmake git libgmp-dev zlib1g-dev libreadline-dev
```

最小構成で通したい場合は、GMPやZLIBなどの任意機能をOFFにする方法もあります。環境によって依存関係が変わるため、CMakeで不足が出た場合は、対応する開発パッケージを入れるか、該当オプションをOFFにしてください。

手動clone:

```bash
mkdir -p SCIP/vendor
git clone https://github.com/scipopt/soplex.git SCIP/vendor/soplex
git clone https://github.com/scipopt/scip.git SCIP/vendor/scip
```

SoPlexを先にビルド・インストール:

```bash
cmake -S SCIP/vendor/soplex \
  -B SCIP/vendor/soplex-build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="$PWD/SCIP/local" \
  -DBOOST=OFF \
  -DBUILD_TESTS=OFF \
  -DBUILD_EXAMPLES=OFF

cmake --build SCIP/vendor/soplex-build -j
cmake --install SCIP/vendor/soplex-build
```

次にSCIPをビルド・インストール:

```bash
cmake -S SCIP/vendor/scip \
  -B SCIP/vendor/scip-build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="$PWD/SCIP/local" \
  -DSOPLEX_DIR="$PWD/SCIP/local/lib/cmake/soplex" \
  -DBUILD_TESTING=OFF

cmake --build SCIP/vendor/scip-build -j
cmake --install SCIP/vendor/scip-build
```

この時点で、次が存在すればSCIP本体のローカル導入は成功です。

```bash
./SCIP/local/bin/scip --version
test -f SCIP/local/lib/cmake/scip/scip-config.cmake
test -f SCIP/local/lib/cmake/soplex/soplex-config.cmake
```

最後に、このリポジトリのOPBラッパーをビルドします。

```bash
cmake -S SCIP -B SCIP/build -DCMAKE_BUILD_TYPE=Release
cmake --build SCIP/build -j
```

注意:

- `SCIP/vendor/scip`、`SCIP/vendor/soplex` はsubmoduleでも手動cloneでも同じ位置を使えます。
- `SCIP/vendor/*-build`、`SCIP/local`、`SCIP/build` はローカル生成物です。
- 公開リポジトリへはビルド成果物を入れず、各利用者の環境で再生成します。

## ビルド

PBSolverディレクトリから実行します。

```bash
cmake -S SCIP -B SCIP/build -DCMAKE_BUILD_TYPE=Release
cmake --build SCIP/build -j
```

ビルドに成功すると `SCIP/build/pb_scip` ができます。
公開リポジトリにはこの実行ファイルは含めず、利用者の環境で再ビルドします。

## 実行

第2引数は時間制限です。省略時は60秒です。

```bash
./SCIP/build/pb_scip problems/opt/clique_coloring_n5_t3.opb
./SCIP/build/pb_scip problems/dec/grid6_07.opb 10
```

出力例:

```text
c 読み込み完了: 55 変数, 245 制約
o 5
o 4
o 2
c SCIP status: OPTIMAL
s OPTIMUM FOUND
v x1 -x2 ...
```

PBソルバ競技形式に従い、新しい最良解が見つかるたびに `o` 行を出力します。

- `c`: コメント・補足情報
- `o`: 暫定解の目的値
- `s`: 最終状態
- `v`: 最終解の変数割り当て

時間制限までに最適性を証明できなかった場合は `s UNKNOWN` を出力します。
実行可能解が見つかっていれば、その場合も最後に `v` 行を出力します。

## runsolver経由で実行

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data scip-solver.log \
  --var scip-result.var \
  ./SCIP/build/pb_scip problems/opt/clique_coloring_n5_t3.opb 10
```
