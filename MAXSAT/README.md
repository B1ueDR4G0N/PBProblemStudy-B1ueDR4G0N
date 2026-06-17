# PySAT RC2 MaxSAT Solver

`pb_rc2.py` は、正規化された線形OPBをPySATのRC2 MaxSATソルバへ渡す簡単なラッパーです。

## 位置づけ

- RC2はMaxSAT系の完全ソルバです。
- OPBのハード制約はPySAT/PBLibでCNFへエンコードします。
- `min:` の線形目的関数は重み付きソフト節へ変換します。
- `max:` 目的関数と非線形OPBには未対応です。

## 実行例

```bash
python3 MAXSAT/pb_rc2.py problems/opt/clique_coloring_n5_t3.opb 10
```

runsolver経由:

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data rc2-solver.log \
  --var rc2-result.var \
  python3 MAXSAT/pb_rc2.py problems/opt/clique_coloring_n5_t3.opb 10
```

## 依存関係

今回の環境では次をユーザー領域に導入済みです。

```bash
python3 -m pip install --user python-sat[pblib,aiger]
```

## Open-WBOについて

Open-WBOも候補として `OpenWBO/` にクローンしています。Open-WBOはMaxSAT Evaluationで使われてきたMaxSAT/PBソルバで、PB入力は `-formula=1` です。

ただし、この環境では開発用 `zlib.h`、`gmpxx.h`、`m4` が不足しており、aptにもroot権限がないため、ソースビルドは未完了です。
