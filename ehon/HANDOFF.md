# 絵本ライン引き継ぎ資料 — 『ロケットは どうして とべるの？』の続きを作る

2026-07-20にYorozuyaで実験・確立した「水彩絵本ファクトリー」の正典。第1作（第一話・全4見開き）は完成済み。
このフォルダ一式で、**同じ絵柄・同じキャラ・同じ組版**の続話をこのプロジェクト内で量産できる。

## 0. 位置づけ（重要）

- 絵本は図鑑本編（site/）とは**別の派生プロダクトライン**。読者想定は子供／家族で、図鑑の「やさしい先生」文体よりさらに幼い。
- 図鑑本編の「生成AI画像は構造が不正確になるため不使用」ルールは**本編の図解の話**。絵本では、生成画像は**情緒・場面**にだけ使い、**構造の正確さが要る要素（力の矢印・ラベル・断面）はSVG/HTMLの後乗せで担保**する。この棲み分けが絵本ラインの核。
- 公開は **EX読み切り枠**として `site/ex/ehon-01/` に第1作が移植済み（2026-07-24、完成JPEG＋index.htmlビューア）。**このehon/フォルダはそのソース層**＝原画・テンプレ・レシピを持つ工房側。続話は ehon/ で作り、完成JPEGだけを site/ex/ehon-NN/ へ出す。art/ のPNG原画は重い（計11MB超）ので site/ には置かない。

## 1. 完成済みの第1作

- 第一話「ロケットは どうして とべるの？」= 図鑑第1話（全体像・作用反作用）の絵本化
- 構成: ①とびら（問いかけ）→ ②風船で体感 → ③しくみ図解（矢印後乗せ）→ ④夜空の余韻＋次回予告
- 成果物: `output/rocket_ehon_ep1.pdf`（4見開き・1.2MB）、`output/book_p1..4.jpg`、めくれるHTML=`templates/book.html`
- Drive納品済み: `マイドライブ\Claude成果物\Yorozuya\ロケット絵本-2026-07-20\`
- サイト公開: `site/ex/ehon-01/`（完成JPEG＋ビューア。2026-07-24移植）

## 2. パイプライン全体像（二層合成）

```
(1) Codexに「文字ゼロの水彩画」を発注 ─→ art/spreadN.png
(2) HTMLテンプレに日本語テキスト＋SVG図解を組む ─→ templates/pageN.html
(3) ヘッドレスChromeで2倍解像度PNG化 ─→ book_pN.png (3072x2048)
(4) JPEG圧縮(q88,1600px) ─→ output/book_pN.jpg (約300KB/枚)
(5) print.html経由でPDF化＋book.htmlでめくれる版
```

AIは画像内の文字が崩れるので**絵に文字を一切描かせない**。文字・矢印は全部コードで乗せる。これが品質の生命線。

**例外（2026-07-24追記）**: かな主体の短い**ロゴ・タイトル文字**は生成できる（「エンジンのなかみ」4案で4/4字形正確）。プロンプトに「EXACTLY this text: ○○ — these N characters only, written correctly, no other text anywhere」と書き、採用前に1字ずつ検品（濁点・鏡文字・余計な画）。本文の長文・漢字混じりは引き続きコード後乗せ。採用ロゴ原版: art/banners/logo-a.png（白飛ばし版 logo-a-white.png を title-card.html で乗算合成）。

## 3. スタイル・バイブル（画風・キャラ固定プロンプト）

全ページのプロンプトは必ず「PRE + 場面描写 + POST」の三段構成。PREとPOSTは一字も変えずに使う（キャラと画風の一貫性はこの固定文字列で担保している）。

**PRE（画風＋キャラ）:**
```
soft watercolor childrens picture book illustration painted on textured cold-press paper with visible paper grain and gentle color bleeds, warm tender storybook mood, limited harmonious palette of peach cream soft teal and warm grey, hand painted look not digital not 3d gentle brush strokes. Recurring character a small boy about five years old with tousled reddish-brown hair wearing a teal-blue jacket and a long flowing coral-red scarf together with his small fluffy dog with white and brown patches.
```

**POST（文字禁止＋横長）:**
```
 Absolutely no text no letters no words no numbers anywhere in the image. Wide landscape composition.
```

**場面描写のコツ（第1作で実証済み）:**
- 文字を置く側に余白を要求する: `Keep the left third of the image calm soft and uncluttered as negative space for text.`
- 図解ページは背景を無地に: `one single friendly little rocket floating in the center on a very simple soft plain cream watercolor sky with almost no scenery ... Minimal uncluttered diagram friendly.`
- キャラはPREの外見記述だけで毎回ほぼ同一人物になる（完全一致はしないが絵本の味の範囲）。**服装や犬の柄をPRE以外で上書きしない**こと。

## 4. Codex発注レシピ（imagegen）

PowerShellから（stdinを閉じる `< NUL` 必須。1枚1〜2分）:

```powershell
$dir = "<このehonフォルダのフルパス>\art"
$pre  = "<上のPRE>"
$post = "<上のPOST>"
$scene = "Scene: <英語で場面描写>. Keep the left third calm as negative space for text."
$c = 'codex exec -C ' + $dir + ' -s workspace-write --skip-git-repo-check "Use the image generation tool to generate an image: ' + $pre + $scene + $post + ' Save it as ./spread5.png" < NUL > ' + $dir + '\run.log 2>&1'
cmd /c $c
```

生成後は必ずReadで検品（構図崩れ・意図しない文字混入・キャラの服装違い）。ダメなら場面描写を直して再発注。

## 5. 文字組の型（子供向け・確定仕様）

- フォント: **UD Digi Kyokasho NP-R（本文）/ NP-B（題・強調）**。Windows 10標準搭載
- 文体: **ひらがな多め＋分かち書き**（語間に半角スペース）＋**オノマトペ**（「ぷしゅーっ」「ぐーん」「ごおーっ」）＋タイトルは問いかけ（「〜の？」）
- 色: 題 `#e07a2c`（橙）、本文 `#5a4230`（焦茶）、強調 `#c85a1e`、ラベル `#a06a38`。夜ページは題 `#ffd98a`・本文 `#f3ead9`＋text-shadow
- ページ寸法: **1536x1024**（3:2横長）。テキストブロックは左上 `left:80px; top:78px; width:620〜660px`
- 図解の矢印: SVGで後乗せ。上向き=青緑 `#2f8f8f`、下向き=赤 `#d1502a`、線幅9・丸端・marker三角。ラベルは矢印の先端側に置く（本文と重ねない）
- 詳細は `templates/page1..4.html` が実物サンプル。**新ページはこれを複製して中身を差し替えるのが最速**

## 6. レンダリング〜完成レシピ

**HTML→PNG（2倍解像度）:**
```powershell
$fileUrl = ([uri]$htm).AbsoluteUri   # file:///変換はこの書き方（文字列replaceはsandboxに弾かれた実績あり）
$udd = Join-Path $env:TEMP ("ehon_" + [guid]::NewGuid().ToString("N").Substring(0,8))
Start-Process -FilePath $chrome -ArgumentList @("--headless=new","--disable-gpu","--no-sandbox","--hide-scrollbars","--user-data-dir=$udd","--force-device-scale-factor=2","--window-size=1536,1024","--screenshot=$png",$fileUrl) -NoNewWindow -Wait
```

**JPEG圧縮（PNG直PDFだと46MBになる。必ずJPEG化→1.2MB級になる）:**
System.Drawing で 1600x1067 に縮小・品質88で保存（実装は第1作の会話ログ or 下記要点で再現可能: InstalledFontCollection同様 `Add-Type -AssemblyName System.Drawing` が必要）。

**PDF:** `templates/print.html`（`@page { size: 240mm 160mm; margin: 0; }`、JPEG参照）を `--print-to-pdf` + `--no-pdf-header-footer` で。
**めくれる版:** `templates/book.html` にJPEGを並べるだけ（タップ/矢印キー対応・ドットナビつき）。

## 7. 続話の作り方（図鑑9章→絵本のマッピング案）

1話=4見開き構成の型: **とびら（問いかけ）→ みぢかな体感 → しくみ図解 → 余韻＋次回予告**

- 第二話「エンジンのなかみ」（図鑑02 推力と比推力に対応）: 体感=ホースの水を強く/弱く出す、図解=燃焼室→ノズルの流れに矢印
- 第三話「こおりのねんりょう」（図鑑03 固体と液体）: 体感=花火とガスコンロの違い、図解=2種のロケット断面
- 以降も図鑑の章立て（04サイクル/05ターボポンプ/06ノズル/07切り離し/08音とふるえ/09実機）から「子供に刺さる1コンセプト」だけ抜いて絵本化する。全部説明しようとしない（1冊1概念）

**未実装の改善案（Codex壁打ち由来・任意）:** 見開きに「予想→めくる→答え」を1回入れる（HTML版はタップで答え表示）。受動的な閲覧が小さな実験になる。

## 8. ファイル一覧

```
ehon/
├── HANDOFF.md        このファイル
├── art/              水彩原画（文字なし・Codex生成、1536x1024相当）
│   └── spread1..4.png   第一話ぶん
├── templates/        合成HTMLの実物（複製して次話を作る）
│   ├── page1..4.html    各見開き（page3が図解ページのSVG矢印見本）
│   ├── print.html       PDF用（JPEG参照）
│   └── book.html        めくれるHTML絵本ビューア
└── output/           完成品
    ├── book_p1..4.jpg   第一話・合成済み各ページ
    └── rocket_ehon_ep1.pdf
```

## 9. 注意・制約

- Codexへのプロンプトには機微情報を書かない（OpenAIに送られる）
- 画像内に日本語を描かせない（崩れる）。文字は必ずHTML側
- 妻・家族の似顔をAIに描かせない（既存の家内ルール）。登場キャラは架空の男の子と犬のまま
- キャラの完全一致は不可能（gpt-imageの限界）。目立つ違い（服の色・犬の柄）が出たら再生成
- 印刷所レベルの解像度が欲しい場合は `--force-device-scale-factor=3` で4608px級まで上げられる（未検証）
