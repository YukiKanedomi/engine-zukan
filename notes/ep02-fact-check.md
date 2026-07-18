# 第2話「推力と比推力」裏取りメモ（2026-07-15）

執筆前の事実確認。本文・よりみちに書く数値はすべてここで裏を取ってから使う。

## 推力の式

- F = ṁ·ve + (pe − p0)·Ae （運動量項＋圧力項）
- pe（ノズル出口圧）= p0（外気圧）になるのは設計点のみ。それ以外では圧力項が残る
- ロケットは外気を取り込まないので真空でも推力を出せる（ジェット/プロペラとの違い）
- 出典: NASA Glenn Research Center "Rocket Thrust Equation" <https://www.grc.nasa.gov/www/k-12/airplane/rockth.html> ／ Sutton & Biblarz, *Rocket Propulsion Elements* 9th ed., ch.2

## 比推力の定義

- Isp = F / (ṁ·g0) = veq / g0。単位は「秒」（単位系によらず共通）
- 意味: 推進剤の重量流量あたりの推力。大きいほど「同じ推進剤でより多く押せる」
- 直感: 推進剤1kgで、1kgf の推力を Isp 秒間出し続けられる
- 出典: NASA Glenn "Specific Impulse" <https://www.grc.nasa.gov/www/k-12/airplane/specimp.html> ／ Sutton 9th ed., ch.2

## 代表値（真空、断りなければ）

| エンジン | 推進剤 | 比推力 | 備考 |
|---|---|---|---|
| RS-25 (SSME) | LH2/LOX | 452 s（海面366 s） | 二段燃焼 |
| LE-9 (H3 1段) | LH2/LOX | 425 s、推力1471 kN | エキスパンダーブリード |
| Merlin 1D (Falcon 9) | RP-1/LOX | 311 s（海面282 s） | ガス発生器 |
| 固体ブースタ一般 | コンポジット固体 | 250〜280 s | 例: Shuttle SRB 268 s |

- 傾向: 固体 < ケロシン < 水素。水素は軽い分子ほど噴射速度が上がるため
- 出典: Wikipedia RS-25 / SpaceX Merlin / LE-9（各一次資料由来のスペック表）、JAXA H3 公開資料
  - <https://en.wikipedia.org/wiki/RS-25>
  - <https://en.wikipedia.org/wiki/SpaceX_Merlin>
  - <https://en.wikipedia.org/wiki/LE-9>

## 追記（2026-07-18 タップ式の式カード用）

- LE-9 の質量流量 ≈ 353 kg/s は公表値でなく逆算値: ṁ = F/(Isp·g0) = 1,471,000/(425×9.80665)。
  本文では「およそ毎秒350kg（逆算）」と明記して使用
- 「お風呂1杯」= 約200L ≒ 200kg として比喩に使用（350kg/s → 2秒たらずで1杯）

## 第1話との接続チェック

- 第1話よりみち: 「質量比10でも Δv は噴射速度の約2.3倍」→ ln(10)=2.303 ✓
- 第1話 partcard: 1段目=推力優先、2段目=効率優先 → 第2話の「推力と比推力のトレードオフ」で回収する

## 書かない（裏が取れない/深すぎる）

- c* と CF の分離（特性排気速度と推力係数）→ ep.04/06 で扱う候補。ep.02 では出さない
- 実機の細かい設計数値攻め（深さの天井ルール）
