let rx = (./util.dhall).rx

--| けもＶ配信タグ
let kemovLiveStream = rx.any [
  "けも[VＶ]",
  "けぷふるる",
  "どうぶつV",
  "まつけぷ",
  "ケプ狐",
  "(?:ケープペンギン|フンボルトペンギン)ちゃんねる",
  "シマハイシン",
  "フンボル島",
  "熊とペンギン",
]

-- けもＶのチャンネル名。YouTube の動画の説明文で使われる。
let kemovChannelMentions = "@" ++ rx.any [
  "ケープペンギン / African Penguin",
  "シマハイイロギツネ / Island Fox",
  "フンボルトペンギン / Humboldt Penguin - YouTube",
]

--| はなまるうどん用フィルター
let basicMinusHanamaru = rx.i (rx.any [
  "けものフレンズ",
  "けもフレ",
  "Kemono\\s*Friend",
  "ジャパリパーク",
  "Japari\\s*Park",
  "どうぶつビスケッツ",
  "どうビス",
  "ペパプ",
  "Triple-P",
  "Gothic×Luck",
  "ゴシックラック",
  rx.hash "ゴクラク\\b",
  "\\bゴクラジ",
  rx.hash "おやすみおはよ\\b",
  "はなまるアニマル",
  "ジャパリ団",
  rx.hash kemovLiveStream,
  kemovChannelMentions,
  "ちょびるめぷち",
  "かぷせるフレンズ",
  "ワイルドラッシュ",
  "WILDRUSH",
])

--| 基本フィルター
let basic = rx.any [ basicMinusHanamaru, rx.hash "はなまる\\b" ]

-- 個人アカウント用のフィルター
--| 日英バイリンガルアカウントの日本語投稿
let individualJa = rx.i (rx.any [
  "けものフレンズ",
  "けもフレ",
  "舞台(?:けものフレンズ|けもフレ)",
  "ようこそジャパリパーク",
  "ゴクラク\\b",
  "ゴクラジ",
  "おやすみおはよ\\b",
  "はなまる(?:\\b|アニマル)",
  "Xジャパリ団",
  kemovLiveStream,
  "けもレポ",
  "細かすぎて伝わらない舞台けものフレンズの好きなところ",
])
--| English posts from en/ja bilingual accounts (individual)
let individualEn = rx.i "KemonoFriends"
--| 一般用
let individual = rx.any [ rx.hash (rx.any [ individualJa, individualEn ]), kemovChannelMentions ]

--| けもＶ関連ハッシュタグ
--
--  動物名のハッシュタグはけものフレンズと無関係の文脈でも使われるため、このフィルターは VTuber 関連のルールのみで使用する。
let kemovHashtags = rx.hash (rx.any [
  "ケープペンギン",
  "シマハイイロギツネ",
  "フンボルトペンギン",
])

--| 除外ワード
let basicExclude = rx.i (rx.any [
  "たつき監督",
  "irodori",
  "ヤオヨロズ",
  "福原慶匡",
  "ケムリクサ",
  "Tatsuki",
  "Yaoyorozu",
  "Fukuhara Yoshitada",
  "Yoshitada Fukuhara",
])

in {
  basicMinusHanamaru,
  basic,
  individualJa,
  individualEn,
  individual,
  kemovHashtags,
  basicExclude,
}
