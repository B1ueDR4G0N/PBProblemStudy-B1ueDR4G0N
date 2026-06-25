# Usage Notes

このメモは、PBSolverディレクトリで使っている `runsolver` のビルドと実行方法を思い出すためのものです。

## runsolverをmakeする前に必要なもの

`runsolver/src/Makefile` を見ると、ビルドには次が必要です。

| 必要なもの | 理由 |
| --- | --- |
| `make` | Makefileを実行する |
| `g++` | C++11で `runsolver.cc` をコンパイルする |
| pthread | `-pthread` でリンクする。通常はglibc環境に入っている |
| NUMA開発ヘッダ/ライブラリ | `-DWITH_NUMA` と `-lnuma` を使う |

この環境で特に詰まりやすいのはNUMAです。Makefileにも次の警告があります。

```text
WARNING: NUMA headers not found. Compilation may fail.
In such a case, install numactl-devel
```

Ubuntu/Debian/WSLなら、必要パッケージはだいたい次です。

```bash
sudo apt update
sudo apt install build-essential libnuma-dev
```

Fedora/RHEL/CentOS系なら次です。

```bash
sudo dnf install gcc-c++ make numactl-devel
```

古いCentOS系では `dnf` ではなく `yum` を使います。

```bash
sudo yum install gcc-c++ make numactl-devel
```

## この環境で確認できた状態

2026-06-24時点では、以下の状態でした。

```text
g++: 9.4.0
make: GNU Make 4.2.1
numa.h: /usr/include/numa.h が存在
linked library: libnuma.so.1
```

`runsolver/src/runsolver` は `libnuma.so.1` にリンクされています。

```bash
ldd runsolver/src/runsolver
```

主に次のような行が出ればOKです。

```text
libnuma.so.1 => /lib/x86_64-linux-gnu/libnuma.so.1
libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
```

## ビルド手順

PBSolverディレクトリ直下から実行する場合:

```bash
cd runsolver/src
make
```

もし依存関係生成でC++ヘッダ周りのエラーが出る場合は、`CC=g++` を明示します。

```bash
cd runsolver/src
make CC=g++
```

ビルドできると、次の実行ファイルができます。

```text
runsolver/src/runsolver
```

確認:

```bash
./runsolver/src/runsolver --help
```

## よくあるエラー

### `numa.h: No such file or directory`

NUMAヘッダが足りません。

Ubuntu/Debian/WSL:

```bash
sudo apt install libnuma-dev
```

Fedora/RHEL/CentOS:

```bash
sudo dnf install numactl-devel
```

### `/usr/bin/ld: cannot find -lnuma`

NUMAライブラリが足りません。上と同じく `libnuma-dev` または `numactl-devel` を入れます。

### `g++: command not found`

C++コンパイラが足りません。

Ubuntu/Debian/WSL:

```bash
sudo apt install build-essential
```

Fedora/RHEL/CentOS:

```bash
sudo dnf install gcc-c++ make
```

### `make: command not found`

`make` が足りません。

Ubuntu/Debian/WSL:

```bash
sudo apt install make
```

Fedora/RHEL/CentOS:

```bash
sudo dnf install make
```

## 基本の使い方

`runsolver` は、ソルバを時間制限付きで実行し、ログを分けて保存するために使います。

基本形:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data LOG/example.watcher.log \
  --var LOG/example.var \
  <solver-command> <problem-file> \
  > LOG/example.runsolver.log 2>&1
```

ログの役割:

| ファイル | 内容 |
| --- | --- |
| `*.watcher.log` | ソルバ本体の出力。PB形式の `o`、`s`、`v` 行を見る |
| `*.var` | `WCTIME`、`CPUTIME`、`TIMEOUT` などの機械的な実行情報 |
| `*.runsolver.log` | runsolver自身の監視ログ。実行コマンド、終了理由、CPU時間など |

## 例

NaPSを10秒制限で動かす例:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data LOG/naps_sample_pbo.watcher.log \
  --var LOG/naps_sample_pbo.var \
  ./naps/naps-1.02b problems/sample/sample_pbo.opb \
  > LOG/naps_sample_pbo.runsolver.log 2>&1
```

SCIPラッパーを10秒制限で動かす例:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data LOG/scip_sample_pbo.watcher.log \
  --var LOG/scip_sample_pbo.var \
  ./SCIP/build/pb_scip problems/sample/sample_pbo.opb 10 \
  > LOG/scip_sample_pbo.runsolver.log 2>&1
```

Gurobiラッパーを10秒制限で動かす例:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data LOG/gurobi_sample_pbo.watcher.log \
  --var LOG/gurobi_sample_pbo.var \
  python3 GUROBI/pb_gurobi.py problems/sample/sample_pbo.opb 10 \
  > LOG/gurobi_sample_pbo.runsolver.log 2>&1
```

GurobiはWLSライセンスを使うため、`~/.gurobi/gurobi.lic` が必要です。

## ログの確認

解の状態だけ見る:

```bash
grep -E '^(o |s |v )' LOG/example.watcher.log
```

時間だけ見る:

```bash
grep -E '^(WCTIME|CPUTIME|TIMEOUT)=' LOG/example.var
```

終了理由を見る:

```bash
grep -E '^(Real time|CPU time|Child status|Solver just ended)' LOG/example.runsolver.log
```

## 今回残した代表ログ

`LOG/` には、比較レポートの読み方を確認しやすい代表ログを残しています。

| ログ名 | ソルバ | 問題 | 見どころ |
| --- | --- | --- | --- |
| `naps_clique_coloring_n5_t3.*` | NaPS | 小さめのClique Coloring | NaPSが速い例 |
| `scip_miplib_lp4l.*` | SCIP | MIPLIB系PBO | SCIPが線形最適化を解く例 |
| `gurobi_maxcut_5partite_n27.*` | Gurobi | MaxCut PBO | Gurobiが強い例 |
| `roundingsat_knapsack_subset_sum_200.*` | RoundingSat | Knapsack PBO | PBネイティブ系が速い例 |
| `rc2_vertex_cover_grid_dim072.*` | MaxSAT/RC2 | Vertex Cover PBO | MaxSAT変換が効く例 |
