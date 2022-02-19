let rx = ./util/rx.dhall

let kfOfficialScreenNames =
      [ "kemo_project"
      , "kemono_butai"
      , "kemono_matsuri"
      , "kemono_pavilion"
      , "kemono_festival"
      , "kemono_anime"
      , "kemono_friends3"
      , "jppzootobu"
      , "Gothic_Luck"
      , "kemofure_yakata"
      , "X_JPD_official"
      ]

let kemovScreenNames =
      [ "Cape_KEMOV"
      , "Hululu_KEMOV"
      , "Shimahai_KEMOV"
      , "Coyote_KEMOV"
      , "KEMOVP_staff"
      ]

let kemovLiveStreamJa =
    -- 配信タグ
      [ "お引越しフレンズ"
      , "くっくフルルー"
      , rx.wi "けもV"
      , rx.wi "けもVバレンタイン"
      , "けぷふるる"
      , "こんがお"
      , "こんくっく調査団"
      , "こんこんがおのん"
      , rx.wi "こんのん100になるまで終われまテン"
      , "しゅりむす"
      , "すず姫と三匹の従者たち"
      , rx.wi "どうぶつV"
      , "ちぇりけぷ"
      , "ひなけぷ"
      , "まつけぷ"
      , "わいわいピコパ"
      , "アホングアス"
      , "イツメン会議"
      , "ケプ狐"
      , "ケー風注意報"
      , "(?:ケープペンギン|フンボルトペンギン)ちゃんねる"
      , "コンペンハムチェリー"
      , "シカとペンギン"
      , "シマコヨ"
      , "シマハイシン"
      , "フルシカ"
      , "フルルンシマトン"
      , "フンボル島"
      , "ホロけも"
      , "ミミフル"
      , "酒飲みフレンズ"
      , "神様と狐様"
      , "熊とペンギン"
      , rx.wi "新春けもV桃鉄コラボ祭り"
      , rx.wi "秋のけもV大運動会"
      ]

let kemovLiveStreamEn =
    -- Live streaming hastags of KemoV.
      [ rx.wi "KemoV", rx.wi "pikacoyo", rx.wi "shizucoyo" ]

let kemovLiveStream = rx.any (kemovLiveStreamJa # kemovLiveStreamEn)

let kemovChannelMentions =
    -- けもＶのチャンネル名。YouTube の動画の説明文で使われる。
          "@"
      ++  rx.any
            [ "ケープペンギン / African Penguin"
            , "コヨーテ / Coyote"
            , "シマハイイロギツネ / Island Fox"
            , "フンボルトペンギン / Humboldt Penguin - YouTube"
            ]

let mentionOrQuote = rx.any [ "@", "twitter\\.com/" ]

let common =
      [ mentionOrQuote ++ rx.any kfOfficialScreenNames
      , "けものフレンズ"
      , "けもフレ"
      , "${rx.wi "Kemono"}\\s*${rx.wi "Friend"}"
      , "ジャパリパーク"
      , "${rx.wi "Japari"}\\s*${rx.wi "Park"}"
      , "どうぶつビスケッツ"
      , "どうビス"
      , "ペパプ"
      , rx.wi "Triple-P"
      , "ちく☆?たむ"
      , rx.hash "もうトラ"
      , rx.wi "Gothic×Luck"
      , "ゴシックラック"
      , rx.hash "ゴクラク\\b"
      , "\\bゴクラジ"
      , rx.hash "おやすみおはよ\\b"
      , "はなまるアニマル"
      , "ジャパリ団"
      , "ちょびるめぷち"
      , "かぷせるフレンズ"
      , "ワイルドラッシュ"
      , rx.wi "WILDRUSH"
      ]

let kemovCommon =
      [ rx.hash kemovLiveStream
      , kemovChannelMentions
      , mentionOrQuote ++ rx.any kemovScreenNames
      ]

let hanamaru = [ rx.hash "はなまる\\b" ]

let basic =
    -- 基本フィルター
      rx.i (rx.any (common # hanamaru # kemovCommon))

let kemov =
    -- けもＶ関係の話題
      rx.i (rx.any kemovCommon)

let basicMinusKemov =
    -- けもＶ以外の話題。`@KFVP_pipitor` とその他との振り分けに使う
      rx.i (rx.any (common # hanamaru))

let basicMinusHanamaru =
    -- はなまるうどん用フィルター
      rx.i (rx.any (common # kemovCommon))

let individual =
    -- 個人アカウント用のフィルター

      let ja =
          -- 日英バイリンガルアカウントの日本語投稿
            rx.i
              ( rx.any
                  (   [ "けものフレンズ"
                      , "けもフレ"
                      , "舞台(?:けものフレンズ|けもフレ)"
                      , "ようこそジャパリパーク"
                      , "ちくたむ"
                      , "もうトラ"
                      , "ゴクラク\\b"
                      , "ゴクラジ"
                      , "おやすみおはよ\\b"
                      , "はなまる(?:\\b|アニマル)"
                      , rx.wi "Xジャパリ団"
                      ]
                    # kemovLiveStreamJa
                    # [ "けもレポ", "細かすぎて伝わらない舞台けものフレンズの好きなところ" ]
                  )
              )

      let en =
          -- English posts from en/ja bilingual accounts (individual)
            rx.i (rx.any ([ rx.wi "KemonoFriends" ] # kemovLiveStreamEn))

      let common =
          -- 一般用
            rx.any [ rx.hash (rx.any [ ja, en ]), kemovChannelMentions ]

      in  { common, ja, en }

let kemovHashtags =
    -- けもＶ関連ハッシュタグ
    --
    --  動物名のハッシュタグはけものフレンズと無関係の文脈でも使われるため、このフィルターは VTuber 関連のルールのみで使用する。
      rx.hash (rx.any [ "ケープペンギン", "シマハイイロギツネ", "フンボルトペンギン" ])

let basicExclude =
    -- 除外ワード
      rx.i
        ( rx.any
            [ "たつき監督"
            , rx.wi "irodori"
            , "ヤオヨロズ"
            , "福原慶匡"
            , "ケムリクサ"
            , rx.wi "Tatsuki"
            , rx.wi "Yaoyorozu"
            , "${rx.wi "Fukuhara"}\\s${rx.wi "Yoshitada"}"
            , "${rx.wi "Yoshitada"}\\s${rx.wi "Fukuhara"}"
            ]
        )

in  { basic
    , kemov
    , basicMinusKemov
    , basicMinusHanamaru
    , individual
    , kemovHashtags
    , basicExclude
    }
