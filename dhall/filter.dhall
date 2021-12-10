let rx = ./util/rx.dhall

let kfOfficialScreenNames = [
  "kemo_project",
  "kemono_butai",
  "kemono_matsuri",
  "kemono_pavilion",
  "kemono_festival",
  "kemono_anime",
  "kemono_friends3",
  "jppzootobu",
  "Gothic_Luck",
  "kemofure_yakata",
  "X_JPD_official",
  "Cape_KEMOV",
  "Hululu_KEMOV",
  "Shimahai_KEMOV",
  "KEMOVP_staff",
]

--| けもＶ配信タグ
let kemovLiveStreamJa = [
  "お引越しフレンズ",
  rx.wi "けもV",
  "けぷふるる",
  "こんがお",
  "こんこんがおのん",
  "こんのん100になるまで終われまテン",
  rx.wi "どうぶつV",
  "ちぇりけぷ",
  "まつけぷ",
  "アホングアス",
  "イツメン会議",
  "ケプ狐",
  "(?:ケープペンギン|フンボルトペンギン)ちゃんねる",
  "シカとペンギン",
  "シマハイシン",
  "フルルンシマトン",
  "フンボル島",
  "酒飲みフレンズ",
  "熊とペンギン",
]
--| Live streaming hastags of KemoV.
let kemovLiveStreamEn = [
  rx.wi "KemoV",
]
let kemovLiveStream = rx.any (kemovLiveStreamJa # kemovLiveStreamEn)

-- けもＶのチャンネル名。YouTube の動画の説明文で使われる。
let kemovChannelMentions = "@" ++ rx.any [
  "ケープペンギン / African Penguin",
  "シマハイイロギツネ / Island Fox",
  "フンボルトペンギン / Humboldt Penguin - YouTube",
]

--| はなまるうどん用フィルター
let basicMinusHanamaru = rx.i (rx.any [
  rx.any ["@", "https://twitter\\.com/"] ++ "${rx.any kfOfficialScreenNames}",
  "けものフレンズ",
  "けもフレ",
  rx.wi "Kemono" ++ "\\s*" ++ rx.wi "Friend",
  "ジャパリパーク",
  rx.wi "Japari" ++ "\\s*" ++ rx.wi "Park",
  "どうぶつビスケッツ",
  "どうビス",
  "ペパプ",
  rx.wi "Triple-P",
  "ちく☆?たむ",
  rx.hash "もうトラ",
  rx.wi "Gothic×Luck",
  "ゴシックラック",
  rx.hash "ゴクラク\\b",
  "\\bゴクラジ",
  rx.hash "おやすみおはよ\\b",
  "はなまるアニマル",
  "ジャパリ団",
  rx.hash kemovLiveStream,
  kemovChannelMentions,
  rx.wi "秋のけもV大運動会",
  "ちょびるめぷち",
  "かぷせるフレンズ",
  "ワイルドラッシュ",
  rx.wi "WILDRUSH",
])

--| 基本フィルター
let basic = rx.any [ basicMinusHanamaru, rx.hash "はなまる\\b" ]

-- 個人アカウント用のフィルター
--| 日英バイリンガルアカウントの日本語投稿
let individualJa = rx.i (rx.any ([
  "けものフレンズ",
  "けもフレ",
  "舞台(?:けものフレンズ|けもフレ)",
  "ようこそジャパリパーク",
  "ちくたむ",
  "もうトラ",
  "ゴクラク\\b",
  "ゴクラジ",
  "おやすみおはよ\\b",
  "はなまる(?:\\b|アニマル)",
  rx.wi "Xジャパリ団",
] # kemovLiveStreamJa # [
  "けもレポ",
  "細かすぎて伝わらない舞台けものフレンズの好きなところ",
]))
--| English posts from en/ja bilingual accounts (individual)
let individualEn = rx.i (rx.any ([ rx.wi "KemonoFriends" ] # kemovLiveStreamEn))
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
  rx.wi "irodori",
  "ヤオヨロズ",
  "福原慶匡",
  "ケムリクサ",
  rx.wi "Tatsuki",
  rx.wi "Yaoyorozu",
  rx.wi "Fukuhara" ++ "\\s" ++ rx.wi "Yoshitada",
  rx.wi "Yoshitada" ++ "\\s" ++ rx.wi "Fukuhara",
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
