# 追加PBS比較問題

圧縮済みの `normalized-PB24/DEC-LIN` から、PBS、つまり目的関数なしの判定問題を4問展開して比較しました。
ただし、外部ベンチマーク由来の `.opb` 本体は、再配布条件をこのリポジトリ側で保証できないためGitでは追跡しません。
再現したい場合は、[Pseudo-Boolean Competition 2025](https://www.cril.univ-artois.fr/PB25/) の **Benchmarks available in the PB24 format** にある `normalized-PB24.tar` を取得し、下表の対応する問題をローカルに展開してください。

| ファイル | 元ファイル | 変数/制約 | 特徴 |
| --- | --- | --- | --- |
| `vertex_cover_grid6_07_shuf3.opb` | `DEC-LIN/.../vertex-cover/vc-grids-v3_shuffle/normalized-grid6_07.shuf-3.opb.xz` | 42変数 / 85制約 | 小さめの頂点被覆系PBS |
| `sumineq_arity5_p005_shuf2.opb` | `DEC-LIN/.../sumineq/sumineq_pyr_5_shuffle/normalized-sumineqArity5pyramidP005.shuf-2.opb.xz` | 105変数 / 22制約 | sumineq系PBS |
| `subsetcard_eq_random4reg_10_shuf3.opb` | `DEC-LIN/.../subsetcard/random4reg_opb_shuffle/normalized-subsetcard-eq-random4reg-10.shuf-3.opb.xz` | 41変数 / 40制約 | subsetcard系PBS |
| `bitvector_12array_alg_ineq10.opb` | `DEC-LIN/.../bitvector_multiplication_selection/inequalities/ineq10/normalized-12array_alg_ineq10.opb.xz` | 510変数 / 1053制約 | ビットベクトル系PBS。比較的重め |

## 確認

各ファイルの先頭に `min:` / `max:` がないため、すべてPBSです。

```bash
python3 - <<'PY'
from pathlib import Path
for p in sorted(Path("problems/pbs_extra").glob("*.opb")):
    for line in p.read_text().splitlines():
        s = line.strip()
        if s and not s.startswith("*"):
            print(p.name, "PBO" if s.startswith(("min:", "max:")) else "PBS")
            break
PY
```

## 実行例

```bash
./runsolver/src/runsolver \
  --wall-clock-limit 10 \
  --solver-data /tmp/scip-pbs.watcher.log \
  --var /tmp/scip-pbs.var \
  ./SCIP/build/pb_scip problems/sample/sample_pbs.opb 10
```

ソルバ部分を差し替えれば、NaPS、Gurobi、RoundingSat、MaxSAT/RC2でも同じ問題を比較できます。
