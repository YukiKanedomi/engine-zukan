# EX3-EX9 の28ページを合成テンプレから生成する
$ErrorActionPreference = "Stop"
$tplDir = "C:\Users\kanedomi\Desktop\Claude\engine-zukan\ehon\templates"

$dayA = @'
<!doctype html>
<html lang="ja"><head><meta charset="utf-8"><style>
*{margin:0;padding:0;box-sizing:border-box}html,body{width:1536px;height:1024px}
.page{position:relative;width:1536px;height:1024px;overflow:hidden;background:#f3ead9}
.art{position:absolute;inset:0;width:100%;height:100%;object-fit:cover}
.frame{position:absolute;inset:22px;border-radius:10px;box-shadow:0 0 0 2px rgba(255,255,255,.55),0 8px 30px rgba(90,60,30,.18);pointer-events:none}
.tb{position:absolute;left:80px;top:78px;width:660px;color:#4a3220;text-shadow:0 1px 0 rgba(255,252,245,.75)}
.label{font-family:"UD Digi Kyokasho NP-R",sans-serif;font-size:23px;letter-spacing:.14em;color:#a06a38;display:flex;align-items:center;gap:14px;margin-bottom:24px}
.label::before{content:"";width:30px;height:3px;border-radius:2px;background:#d7a15e;display:inline-block}
.title{font-family:"UD Digi Kyokasho NP-B",sans-serif;font-size:58px;line-height:1.32;margin-bottom:30px;color:#e07a2c}
.body{font-family:"UD Digi Kyokasho NP-R",sans-serif;font-size:28px;line-height:2.0;color:#5a4230}
.body .em{font-family:"UD Digi Kyokasho NP-B",sans-serif;color:#c85a1e}
.pn{position:absolute;left:88px;bottom:64px;font-family:"UD Digi Kyokasho NP-R",sans-serif;font-size:26px;color:#a06a38;letter-spacing:.1em}
.pn::after{content:"";display:block;width:52px;height:3px;border-radius:2px;background:#d7a15e;margin-top:10px}
</style></head><body><div class="page">
<img class="art" src="../art/{ART}">
<div class="frame"></div>
<div class="tb">
{LABELBLOCK}
<div class="title">{TITLE}</div>
<div class="body">
{BODY}
</div></div>
<div class="pn">{PN}</div>
</div></body></html>
'@

$diagB = @'
<!doctype html>
<html lang="ja"><head><meta charset="utf-8"><style>
*{margin:0;padding:0;box-sizing:border-box}html,body{width:1536px;height:1024px}
.page{position:relative;width:1536px;height:1024px;overflow:hidden;background:#f6efe0}
.art{position:absolute;inset:0;width:100%;height:100%;object-fit:cover}
.frame{position:absolute;inset:22px;border-radius:10px;box-shadow:0 0 0 2px rgba(255,255,255,.55),0 8px 30px rgba(90,60,30,.18);pointer-events:none}
.tb{position:absolute;left:80px;top:80px;width:560px;color:#4a3220;text-shadow:0 1px 0 rgba(255,252,245,.78)}
.label{font-family:"UD Digi Kyokasho NP-R",sans-serif;font-size:23px;letter-spacing:.14em;color:#a06a38;display:flex;align-items:center;gap:14px;margin-bottom:22px}
.label::before{content:"";width:30px;height:3px;border-radius:2px;background:#d7a15e;display:inline-block}
.title{font-family:"UD Digi Kyokasho NP-B",sans-serif;font-size:52px;line-height:1.32;color:#e07a2c}
.body{position:absolute;left:80px;bottom:150px;width:700px;font-family:"UD Digi Kyokasho NP-R",sans-serif;font-size:27px;line-height:1.95;color:#5a4230;text-shadow:0 1px 0 rgba(255,252,245,.78)}
.body .em{font-family:"UD Digi Kyokasho NP-B",sans-serif;color:#c85a1e}
.pn{position:absolute;left:88px;bottom:64px;font-family:"UD Digi Kyokasho NP-R",sans-serif;font-size:26px;color:#a06a38;letter-spacing:.1em}
.pn::after{content:"";display:block;width:52px;height:3px;border-radius:2px;background:#d7a15e;margin-top:10px}
</style></head><body><div class="page">
<img class="art" src="../art/{ART}">
<div class="frame"></div>
<div class="tb">
{LABELBLOCK}
<div class="title">{TITLE}</div>
</div>
<div class="body">
{BODY}
</div>
<div class="pn">{PN}</div>
</div></body></html>
'@

$nightN = @'
<!doctype html>
<html lang="ja"><head><meta charset="utf-8"><style>
*{margin:0;padding:0;box-sizing:border-box}html,body{width:1536px;height:1024px}
.page{position:relative;width:1536px;height:1024px;overflow:hidden;background:#20344f}
.art{position:absolute;inset:0;width:100%;height:100%;object-fit:cover}
.frame{position:absolute;inset:22px;border-radius:10px;box-shadow:0 0 0 2px rgba(255,255,255,.35),0 8px 30px rgba(0,0,0,.28);pointer-events:none}
.tb{position:absolute;left:80px;top:100px;width:640px;color:#fdf6e8;text-shadow:0 2px 10px rgba(15,25,45,.85)}
.label{font-family:"UD Digi Kyokasho NP-R",sans-serif;font-size:23px;letter-spacing:.14em;color:#e7cfa0;display:flex;align-items:center;gap:14px;margin-bottom:24px}
.label::before{content:"";width:30px;height:3px;border-radius:2px;background:#e7cfa0;display:inline-block}
.title{font-family:"UD Digi Kyokasho NP-B",sans-serif;font-size:56px;line-height:1.3;margin-bottom:30px;color:#ffd98a}
.body{font-family:"UD Digi Kyokasho NP-R",sans-serif;font-size:28px;line-height:2.0;color:#f3ead9}
.body .em{font-family:"UD Digi Kyokasho NP-B",sans-serif;color:#ffd98a}
.pn{position:absolute;left:88px;bottom:64px;font-family:"UD Digi Kyokasho NP-R",sans-serif;font-size:26px;color:#e7cfa0;letter-spacing:.1em;text-shadow:0 2px 8px rgba(15,25,45,.8)}
.pn::after{content:"";display:block;width:52px;height:3px;border-radius:2px;background:#e7cfa0;margin-top:10px}
</style></head><body><div class="page">
<img class="art" src="../art/{ART}">
<div class="frame"></div>
<div class="tb">
{LABELBLOCK}
<div class="title">{TITLE}</div>
<div class="body">
{BODY}
</div></div>
<div class="pn">{PN}</div>
</div></body></html>
'@

$pages = @(
  @{b=3;p=1;m="A";art="ex3_s1.png";label="エンジンのなかみ　ロケットの まき　その三";title="ロケットの ごはんは<br>なあに？";body="ゆうがたの おにわで、せんこうはなび。<br>ちいさな ひが、ぱちぱち ひかる。<br>じつは ロケットの「ごはん」にも、<br>この はなびの なかまが いるんだよ。"},
  @{b=3;p=2;m="N";art="ex3_s2.png";label="① はなびを よく みてみよう";title="いちど ついたら、<br>とまらない";body="はなびは とちゅうで「やすみ」が できない。<br>さいごまで ぱちぱち もえつづける。<br>そのかわり、いつでも すぐ つけられて、ちからも つよい。<br>これが <span class=""em"">かたい ごはん</span> の せいかくだ。"},
  @{b=3;p=3;m="B";art="ex3_s3.png";label="② ふたつの ごはん";title="かたい ごはんと、<br>つめたい ごはん";body="ひだりは <span class=""em"">かたい ごはん</span>。ぎゅっと つまって、いちどに もえる。<br>みぎは <span class=""em"">つめたい ごはん</span>。タンクから ポンプで おくって、<br>つよさを じゆうに かえられる。<br>H3ロケットは、なんと りょうほう たべるんだ。"},
  @{b=3;p=4;m="N";art="ex3_s4.png";label="";title="りょうほう たべて、<br>つよくなる";body="なつまつりの よぞら。はなびの むこうを、<br>ロケットの ひかりが すーっと のぼっていく。<br>かたい ごはんで どーんと とびだして、<br>つめたい ごはんで ていねいに のぼる。<br>——つぎは、ポンプを まわす ふしぎな ちからの おはなし。"},
  @{b=4;p=1;m="A";art="ex4_s1.png";label="エンジンのなかみ　ロケットの まき　その四";title="ポンプは だれが<br>まわすの？";body="かわの みずぐるまが、ゆっくり まわる。<br>ながれる みずの ちからだ。<br>ロケットの なかにも「まわる もの」が あったよね。<br>あれは いったい、だれが まわしているんだろう？"},
  @{b=4;p=2;m="A";art="ex4_s2.png";label="① だいどころで はっけん";title="ゆげの ちからは<br>すごい";body="やかんが しゅんしゅん いいだした。<br>ゆげに かざぐるまを かざすと——くるくるくる！<br>あつい ゆげには、ものを まわす ちからが ある。<br>ロケットは この ちからを つかうんだ。"},
  @{b=4;p=3;m="B";art="ex4_s3.png";label="② エンジンの なかでは";title="おゆを わかして、<br>まわす";body="エンジンの らっぱは、ほのおで とっても あつい。<br>そこに つめたい ねんりょうを ながすと <span class=""em"">ぶわっ</span> と ゆげになる。<br>その ゆげが ちいさな みずぐるま（タービン）を まわして、<br>ポンプを うごかす。H3の エンジンの ひみつだよ。"},
  @{b=4;p=4;m="A";art="ex4_s4.png";label="";title="おふろでも、<br>くるくる";body="きょうの おふろにも、ゆげが もくもく。<br>かざぐるまを おいたら、やっぱり まわった。<br>おふろと おなじ しくみで そらへ いくなんて、<br>ロケットって みぢかだね。<br>——つぎは、ロケットの「しんぞう」の おはなし。"},
  @{b=5;p=1;m="A";art="ex5_s1.png";label="エンジンのなかみ　ロケットの まき　その五";title="ロケットの<br>しんぞうの おと";body="いぬの むねに みみを あてると、<br>とくん、とくん、と きこえる。<br>しんぞうは からだじゅうに ちを おくる ポンプ。<br>ロケットにも、しんぞうが あるんだよ。"},
  @{b=5;p=2;m="A";art="ex5_s2.png";label="① おかを かけのぼったら";title="がんばるときは、<br>はやく どきどき";body="おかの うえまで きょうそうしたら、<br>しんぞうが どきどき どきどき！<br>がんばる ときほど、たくさん おくる。<br>ロケットの しんぞうも おなじだよ。"},
  @{b=5;p=3;m="B";art="ex5_s3.png";label="② これが ロケットの しんぞう";title="2びょうで おふろが<br>いっぱいに";body="くるくる まわって ねんりょうを すいこみ、<br>ぎゅーっと おしだす。なまえは <span class=""em"">ターボポンプ</span>。<br>2びょうで おふろが いっぱいに なるほど おくるのに、<br>おおきさは せんたくきくらい。ちいさな だいりきもちだ。"},
  @{b=5;p=4;m="N";art="ex5_s4.png";label="";title="よるの そらに、<br>とくん とくん";body="とおくの そらを、ロケットが のぼっていく。<br>あの なかでも いま、しんぞうが<br>ものすごい はやさで はたらいている。<br>むねに てを あてたら、なんだか なかまみたい。<br>——つぎは、おしりの「らっぱ」の ひみつ。"},
  @{b=6;p=1;m="A";art="ex6_s1.png";label="エンジンのなかみ　ロケットの まき　その六";title="らっぱは なんで<br>ひろがってるの？";body="ぷっぷー！ らっぱの くちは ひろがってる。<br>おとを とおくへ とどける ためだね。<br>ロケットの おしりの らっぱも ひろがってる。<br>あれは なんの ためだろう？"},
  @{b=6;p=2;m="A";art="ex6_s2.png";label="① ふうせんで じっけん";title="ほそくすると、<br>はやくなる";body="ふうせんの くちを ぎゅっと ほそく つまむと、<br>くうきが「<span class=""em"">ぴゅーっ</span>」と はやく とびだす！<br>いぬの みみが ぴゅんぴゅん なびくほど。<br>ほそい ところを とおると、ながれは はやくなるんだ。"},
  @{b=6;p=3;m="B";art="ex6_s3.png";label="② らっぱの なかみ";title="しぼって、ひろげて、<br>もっと はやく";body="ロケットの らっぱは、まんなかが いちばん ほそい。<br>ほそい ところで うんと はやくなった ガスは、<br>ふしぎなことに、こんどは <span class=""em"">ひろげるほど</span> はやくなる。<br>だから おっきな らっぱなんだ。はやさを つくる かたちだよ。"},
  @{b=6;p=4;m="A";art="ex6_s4.png";label="";title="ゆうやけの らっぱ";body="ゆうやけの そらへ、ロケットが のぼる。<br>おしりの らっぱが きらきら ひかってる。<br>あの かたちが、ガスを うんと はやく なげて、<br>ロケットを おしあげて いるんだね。<br>——つぎは、じょうずな「ばいばい」の おはなし。"},
  @{b=7;p=1;m="A";art="ex7_s1.png";label="エンジンのなかみ　ロケットの まき　その七";title="じょうずな<br>ばいばい";body="ふーっ。たんぽぽの わたげが とんでいく。<br>たねは おやから ばいばいして、とおくへ いく。<br>ロケットも たびの とちゅうで、<br>だいじな「ばいばい」を するんだよ。"},
  @{b=7;p=2;m="A";art="ex7_s2.png";label="① ききゅうに のったら";title="おもいものを おとすと、<br>あがる";body="ききゅうが なかなか あがらないとき、<br>すなの ふくろを ぽとん と おとす。<br>すると ふわーっと かるくなって、ぐんぐん あがる！<br>かるいって、それだけで ちからに なるんだ。"},
  @{b=7;p=3;m="B";art="ex7_s3.png";label="② ロケットの ばいばい";title="からっぽに なったら、<br>そっと はなす";body="ねんりょうを つかいきった ぶぶんは、もう おもいだけ。<br>ちいさな バネで <span class=""em"">そっと</span> おして、ばいばいする。<br>かるく なった ロケットは、そのぶん はやく なれる。<br>すてるのは かなしくない、たびの さくせんだよ。"},
  @{b=7;p=4;m="A";art="ex7_s4.png";label="";title="パラシュートで、<br>また いつか";body="やくめを おえた ぶぶんが、<br>パラシュートで ゆっくり うみへ おりていく。<br>「ありがとう、ばいばーい！」<br>ちゃんと おわかれ できるのも、かっこいいね。<br>——つぎは、うちあげの「おおきな おと」の おはなし。"},
  @{b=8;p=1;m="A";art="ex8_s1.png";label="エンジンのなかみ　ロケットの まき　その八";title="おおきな おとと、<br>みずの まほう";body="かみなりの よる。ごろごろ どーん！<br>おとが おおきいと、むねまで ふるえるね。<br>ロケットの おとは、かみなりよりも すごい。<br>そのままだと、ロケットじしんが こわれちゃうんだ。"},
  @{b=8;p=2;m="N";art="ex8_s2.png";label="① おまつりの たいこ";title="おとの しょうたいは、<br>ふるえ";body="どん！ と たいこを たたくと、<br>おなかの おくまで ふるえが とどく。<br>おとは くうきの <span class=""em"">ふるえ</span> なんだ。<br>おおきすぎる ふるえは、ものを こわす ちからに なる。"},
  @{b=8;p=3;m="B";art="ex8_s3.png";label="② はっしゃだいの まほう";title="みずが おとを<br>たべてくれる";body="うちあげの しゅんかん、はっしゃだいは<br>ものすごい りょうの みずを ざばーっと まく。<br>ちいさな みずの つぶたちが、おとの ふるえを<br>ぱくぱく たべて、やわらかく してくれるんだ。"},
  @{b=8;p=4;m="A";art="ex8_s4.png";label="";title="くもの なかに、にじ";body="うちあげの あとには、まっしろい くもが のこる。<br>あれは みずの くも。よくみると、にじが かかってる。<br>おおきな おとを てなずけた、やさしい まほうの あとだよ。<br>——つぎは いよいよ さいごの おはなし。<br>ほんものの ロケットに あいにいこう。"},
  @{b=9;p=1;m="A";art="ex9_s1.png";label="エンジンのなかみ　ロケットの まき　その九（さいご）";title="いつか、<br>そらの むこうへ";body="はくぶつかんに、おおきな ロケットが 2ほん。<br>ふとっちょさんと、のっぽさん。<br>かたちは ちがうけど、どちらも そらへ いった<br>ほんものの ゆうしゃたちだ。"},
  @{b=9;p=2;m="A";art="ex9_s2.png";label="① ぜんぶ しってるね";title="なかみが わかると、<br>もっと すき";body="「ここが しんぞうの ポンプでしょ、<br>ここが らっぱで、ここで ばいばいするの！」<br>ぼくは もう、ロケットの なかみを しってる。<br>しってるって、なんだか うれしいね。"},
  @{b=9;p=3;m="B";art="ex9_s3.png";label="② 2ほんの ゆうしゃ";title="ふとっちょさんと<br>のっぽさん";body="ふとっちょさんは、かたい ごはんの ブースタを 2ほん さげてる。<br>のっぽさんは、くろい おびの ところで ばいばいが とくい。<br>つくった ひとたちの かんがえは ちがっても、<br>そらへの みちは おんなじだ。"},
  @{b=9;p=4;m="N";art="ex9_s4.png";label="";title="おやすみ、<br>また あした";body="きょうは いっぱい ロケットの ゆめを みよう。<br>いつか ほんものの うちあげを、いっしょに みにいこうね。<br>だいいっかん、これで おしまい。<br>よんでくれて ありがとう。<br>おやすみなさい。"}
)

foreach ($pg in $pages) {
  $tpl = switch ($pg.m) { "A" { $dayA } "B" { $diagB } "N" { $nightN } }
  $labelBlock = ""
  if ($pg.label -ne "") { $labelBlock = '<div class="label">' + $pg.label + '</div>' }
  $html = $tpl.Replace("{ART}", $pg.art).Replace("{LABELBLOCK}", $labelBlock).Replace("{TITLE}", $pg.title).Replace("{BODY}", $pg.body).Replace("{PN}", [string]$pg.p)
  $out = Join-Path $tplDir ("ex$($pg.b)_page$($pg.p).html")
  [IO.File]::WriteAllText($out, $html, (New-Object System.Text.UTF8Encoding($false)))
}
Write-Output ("generated " + $pages.Count + " page templates")
