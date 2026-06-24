#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

DO_PYTHON=1
DO_ROUNDINGSAT=1
DO_RUNSOLVER=1
DO_SUBMODULES=1
DO_SCIP_WRAPPER=0

usage() {
  cat <<'USAGE'
Usage: scripts/init_third_party.sh [options]

外部依存の初期セットアップをまとめて行います。

実行すること:
  - SCIP / SoPlex submodule の取得
  - Python依存関係の導入: gurobipy, python-sat[pblib,aiger]
  - runsolver の make
  - RoundingSat の clone

実行しないこと:
  - Gurobiライセンスの取得や作成
  - NaPSバイナリの自動ダウンロード
  - sudo apt/dnf/yum によるシステムパッケージ導入
  - SCIP本体のビルド/インストール

Options:
  --all                 デフォルト。安全な範囲のセットアップを実行
  --skip-python         Python依存を入れない
  --skip-roundingsat    RoundingSatをcloneしない
  --skip-runsolver      runsolverをmakeしない
  --skip-submodules     Git submoduleを取得しない
  --build-scip-wrapper  既にSCIP/localがある場合にSCIPラッパーをビルド
  -h, --help            このヘルプを表示

事前に必要になりやすいもの:
  Ubuntu/Debian/WSL:
    sudo apt install build-essential cmake git libnuma-dev python3-pip

  Fedora/RHEL系:
    sudo dnf install gcc-c++ cmake git make numactl-devel python3-pip
USAGE
}

log() {
  printf '\n==> %s\n' "$*"
}

warn() {
  printf '\n[注意] %s\n' "$*" >&2
}

need_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    warn "'$1' が見つかりません。先にインストールしてください。"
    return 1
  fi
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --all)
      ;;
    --skip-python)
      DO_PYTHON=0
      ;;
    --skip-roundingsat)
      DO_ROUNDINGSAT=0
      ;;
    --skip-runsolver)
      DO_RUNSOLVER=0
      ;;
    --skip-submodules)
      DO_SUBMODULES=0
      ;;
    --build-scip-wrapper)
      DO_SCIP_WRAPPER=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      warn "未知のオプション: $1"
      usage
      exit 2
      ;;
  esac
  shift
done

log "PBSolver third-party setup"
printf '作業ディレクトリ: %s\n' "$ROOT_DIR"

if [ "$DO_SUBMODULES" -eq 1 ]; then
  log "SCIP / SoPlex submodule を取得"
  need_cmd git
  git submodule update --init --recursive
else
  log "SCIP / SoPlex submodule 取得をスキップ"
fi

if [ "$DO_PYTHON" -eq 1 ]; then
  log "Python依存関係をユーザー領域に導入"
  need_cmd python3
  python3 -m pip install --user -r GUROBI/requirements.txt
  python3 -m pip install --user 'python-sat[pblib,aiger]'
else
  log "Python依存関係の導入をスキップ"
fi

if [ "$DO_RUNSOLVER" -eq 1 ]; then
  log "runsolver を make"
  need_cmd make
  need_cmd g++
  if [ ! -e /usr/include/numa.h ]; then
    warn "/usr/include/numa.h が見つかりません。Ubuntu/Debianなら libnuma-dev、Fedora/RHEL系なら numactl-devel が必要です。"
  fi
  make -C runsolver/src
else
  log "runsolver の make をスキップ"
fi

if [ "$DO_ROUNDINGSAT" -eq 1 ]; then
  log "RoundingSat を用意"
  need_cmd git
  if [ -d RoundingSat/.git ]; then
    printf 'RoundingSat/ は既に存在します。更新する場合は手動で git -C RoundingSat pull を実行してください。\n'
  elif [ -e RoundingSat ]; then
    warn "RoundingSat というパスが既に存在しますがGitリポジトリではありません。必要なら退避してから再実行してください。"
  else
    git clone https://gitlab.com/MIAOresearch/software/roundingsat.git RoundingSat
    printf 'RoundingSatのビルド方法は配布元READMEを確認してください。\n'
  fi
else
  log "RoundingSat の clone をスキップ"
fi

if [ "$DO_SCIP_WRAPPER" -eq 1 ]; then
  log "SCIPラッパーをビルド"
  need_cmd cmake
  if [ ! -d SCIP/local ]; then
    warn "SCIP/local がありません。先にSCIP/SoPlex本体をビルド・インストールしてください。"
  else
    cmake -S SCIP -B SCIP/build -DCMAKE_BUILD_TYPE=Release
    cmake --build SCIP/build -j
  fi
else
  log "SCIPラッパーのビルドをスキップ"
fi

log "手動で必要なもの"
cat <<'TODO'
- Gurobi:
  - 利用者自身のライセンスを取得してください。
  - WLSライセンスファイルは ~/.gurobi/gurobi.lic に配置してください。
  - gurobi.lic やWLS秘密情報はGitにコミットしないでください。

- NaPS:
  - 再配布条件を確認したうえで、配布元から利用者自身で入手してください。
  - この実験では naps/naps-1.02b に配置する前提です。

- SCIP本体:
  - submodule取得だけでは SCIP/local は作られません。
  - SCIP/SoPlexのビルド・インストール手順は配布元ドキュメントを確認してください。
  - SCIP/local が用意できた後、--build-scip-wrapper を付けてこのスクリプトを再実行できます。
TODO

log "確認コマンド"
cat <<'CHECK'
./runsolver/src/runsolver --help
python3 - <<'PY'
import gurobipy
from pysat.formula import WCNF
print("Python dependencies: OK")
PY
CHECK

log "完了"
