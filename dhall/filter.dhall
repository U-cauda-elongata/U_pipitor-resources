let rx = ./util/rx.dhall

let screenNames =
      let kfOfficial =
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

      let kemov =
            [ "Cape_KEMOV"
            , "Direwolf_KEMOV"
            , "Hululu_KEMOV"
            , "Shimahai_KEMOV"
            , "Coyote_KEMOV"
            , "KEMOVP_staff"
            ]

      in  { kfOfficial, kemov }

let kemovLiveStream =
    -- 配信タグ
      let ja =
          -- 日本語
            [ "UNOフレンズ"
            , "お引越しフレンズ"
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
            , "ぴーちゃんイロちゃん"
            , "まつけぷ"
            , "わいわいピコパ"
            , "アホングアス"
            , "イオリンとギチューネ"
            , "イツメン会議"
            , "キツネにつままれるシカ"
            , "ケプ狐"
            , "ケープウルフ"
            , "ケー風注意報"
            , "(?:ケープペンギン|フンボルトペンギン)ちゃんねる"
            , "コンペンハムチェリー"
            , "シカとペンギン"
            , "シマコヨ"
            , "シマハイシン"
            , "ダイアはここにいる"
            , "フルシカ"
            , "フルルンシマトン"
            , "フンボル島"
            , "ホロけも"
            , "ミミフル"
            , "ワイワイ練習会"
            , "酒飲みフレンズ"
            , "神様と狐様"
            , "熊とペンギン"
            , rx.wi "新春けもV桃鉄コラボ祭り"
            , rx.wi "秋のけもV大運動会"
            ]

      let en =
          -- 英語
          -- Live streaming hastags of KemoV.
            [ rx.wi "CoyoMio"
            , rx.wi "KemoV"
            , rx.wi "pikacoyo"
            , rx.wi "shizucoyo"
            ]

      let common = ja # en

      in  { common, ja, en }

let kemovChannelMentions =
    -- けもＶのチャンネル名。YouTube の動画の説明文で使われる。
          "@"
      ++  rx.any
            [ "ケープペンギン / African Penguin"
            , "コヨーテ / Coyote"
            , "シマハイイロギツネ / Island Fox"
            , "ダイアウルフ / Dire Wolf"
            , "フンボルトペンギン / Humboldt Penguin"
            ]

let mentionOrQuote = rx.any [ "@", "twitter\\.com/" ]

let common =
      [ mentionOrQuote ++ rx.any screenNames.kfOfficial
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
      [ rx.hash (rx.any kemovLiveStream.common)
      , kemovChannelMentions
      , mentionOrQuote ++ rx.any screenNames.kemov
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
              [ "けものフレンズ"
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
            # kemovLiveStream.ja
            # [ "けもレポ", "細かすぎて伝わらない舞台けものフレンズの好きなところ" ]

      let en =
          -- English posts from en/ja bilingual accounts (individual)
            [ rx.wi "KemonoFriends" ] # kemovLiveStream.en

      let common =
          -- 一般用
            rx.any [ rx.hash (rx.i (rx.any (ja # en))), kemovChannelMentions ]

      in  { common, ja = rx.i (rx.any ja), en = rx.i (rx.any en) }

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
