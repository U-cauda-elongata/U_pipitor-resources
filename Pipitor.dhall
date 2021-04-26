let Pipitor =
  https://raw.githubusercontent.com/tesaguri/pipitor/dhall-schema-v0.3.0-alpha.9/schema.dhall sha256:08f433d482a6e6354598d74264693100b411a4873166dfe953119c97310d7a0d

let Feed = Pipitor.Topic.Feed
let Twitter = Pipitor.Topic.Twitter
let Filter = Pipitor.Filter
let Rule = Pipitor.Rule
let Outbox = Pipitor.Outbox

let pipitor = 1120428863828316160 -- @KF_pipitor
let pipitorIndv = 1175697149343887360 -- @KF_pipitor_indv
let pipitorIntl = 1156087464907329536 -- @KF_pipitor_intl
let list = 1121823136167542784 -- @KF_pipitor/list

-- 空白・コメント行および大文字小文字の違いを無視する
let ix = \(regex : Text) -> "(?:(?ix)" ++ regex ++ ")"
-- 引数のパターンのハッシュタグにマッチする
let hash = \(regex : Text) -> "(?:\\#|＃)(?:" ++ regex ++ ")"

-- はなまるうどん用フィルター
let basicFilterMinusHanamaru = ix (''
  けものフレンズ
  | けもフレ
  | Kemono\s*Friend
  | ジャパリパーク
  | Japari\s*Park
  | どうぶつビスケッツ
  | どうビス
  | ペパプ
  | Triple-P
  | Gothic×Luck
  | ゴシックラック
  '' ++ ("|" ++ hash "ゴクラク\\b") ++ ''
  | はなまるアニマル
  | ジャパリ団
  | ちょびるめぷち
  | かぷせるフレンズ
  | ワイルドラッシュ
  | WILDRUSH
  '')
-- 基本フィルター
let basicFilter = basicFilterMinusHanamaru ++ "|" ++ hash "はなまる\\b"

-- 個人アカウント用のフィルター
-- 日英バイリンガルアカウントの日本語投稿
let individualFilterJa = ix ''
  けものフレンズ
  | けもフレ
  | 舞台(?:けものフレンズ|けもフレ)
  | ようこそジャパリパーク
  | ゴクラク\b
  | はなまる(?:\b|アニマル)
  | Xジャパリ団
  | けもレポ
  | 細かすぎて伝わらない舞台けものフレンズの好きなところ
  ''
-- English posts from en/ja bilingual accounts (individual)
let individualFilterEn = ix "KemonoFriends"
-- 一般用
let individualFilter = hash (individualFilterJa ++ "|" ++ individualFilterEn)

let basicExclude = ix ''
  たつき監督
  | irodori
  | ヤオヨロズ
  | 福原慶匡
  | ケムリクサ
  | Tatsuki
  | Yaoyorozu
  | Fukuhara Yoshitada
  | Yoshitada Fukuhara
  ''

-- 日英バイリンガルアカウント群（個人）
let bilingualIndvAccts = [
  Twitter 357183969, -- @Kyokalovesanime 京香 Kyoka
]

let twitter = Pipitor.Twitter::{
  user = pipitor,
  list = Some Pipitor.TwitterList::{
    id = list,
    delay = { secs = 1, nanos = 500000000 },
  },
}

let rule = [
  -- 全ての投稿がけものフレンズに関連する（と推定される）ため `filter` が不要なトピック群
  Rule::{
    outbox = [Outbox.Twitter pipitor],
    topics = [
      -- ケープペンギン / African Penguin
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCEcMIuGR8WO2TwL9XIpjKtw",
      -- フンボルトペンギン / Humboldt Penguin
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCmYO-WfY7Tasry4D1YB4LJw",
      -- 『けものフレンズプロジェクト』公式
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCEOugXOAfa-HRmRjKbH8z3Q",
      -- 東武ジャパリパーク
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCkixBP-HQPS0lOyCpdFWQEg",

      -- Twitter の場合はそれぞれのアカウントをフォローすれば事足りるため収集対象外とする
      -- Twitter 1258240637368799233, -- @X_JPD_official ❌【official】×ジャパリ団　広報団員❌
      -- Twitter 1148893601813843969, -- @kemofrie3locate けものフレンズ３＠ロケテ情報
      -- Twitter 1102890198411632641, -- @kemofure_yakata 【公式】けものフレンズ屋形船～輝きを追いかけて～
      -- Twitter 1090197229556486144, -- @Gothic_Luck Gothic×Luck 公式
      -- Twitter 1075640900414570497, -- @jppzootobu 【公式】東武ジャパリパーク
      -- Twitter 1073098190868508677, -- @kemono_friends3 けものフレンズ３＠公式アカウント
      -- Twitter 1068364107198296066, -- @smcc_kemono 三井住友カード×けものフレンズ
      -- Twitter 1036212563300610048, -- @kemono_anime 【公式】けものフレンズ２アニメ
      -- Twitter 971715886808576001, -- @kemono_festival 【公式】けものフレンズ FESTIVAL
      -- Twitter 909669017295523840, -- @kemono_pavilion けものフレンズぱびりおん【公式】
      -- Twitter 874816424522391553, -- @kemono_matsuri お祭だよ！けものフレンズがーでん
      -- Twitter 855370277739311104, -- @kemono_butai 【公式】舞台「けものフレンズ」
      -- Twitter 2801592695, -- @kemo_project けものフレンズ＠公式アカウント
    ],
  },
  Rule::{
    filter = Some Filter::{ title = basicFilter },
    exclude = Some Filter::{ title = hash "今日のニコニコ生放送" },
    outbox = [Outbox.Twitter pipitor],
    topics = [
      -- 公式・準公式
      -- テレビ東京公式 TV TOKYO
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCrDj5t8Q9ZFSGft7a3PWl9g",
      -- ブシロードブシモ
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCqs9jj1PpzBDBYGrnGrLRYQ",
      -- KADOKAWAanime
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCY5fcqgSrQItPAX_Z5Frmwg",
      -- SEGA
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCVkqs_Q88BDmyaWwjYJ8_Ig",
      -- ブシロード公式チャンネル
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCFoS_FzutpGb3EDH3dZ47sw",
      -- Victor Entertainment
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UC4YT50DP7hbMsor8FmyEPMw",
      -- セガゲームス公式アプリ
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UC3tZDwLVGnZKl9477fCxhGQ",
      Twitter 1303969509779275776, -- @kizunaStage -絆- on Stage 2020
      Twitter 1123410609922396160, -- @aoni_official 青二プロダクション【公式】
      Twitter 1012239092279476224, -- @nicogame_PR ニコニコゲーム公式@ログインなしで視聴可能
      Twitter 974249862957903873, -- @justpro_voice ジャストプロ 声優部
      Twitter 923054746977517568, -- @official_hibiki 響スタッフアカウント
      Twitter 891908618789937152, -- @NelkePlanning ネルケプランニング（公式）
      Twitter 874810152875995136, -- @Equal_LOVE_12 ＝LOVE_official
      Twitter 830022722063183872, -- @nhk_darwin ダーウィンが来た！
      Twitter 828422165808570369, -- @justpro_0411 株式会社ジャストプロ
      Twitter 824551506737192960, -- @GGI_INC 株式会社ギャラクシーグラフィックス
      Twitter 809555576233422849, -- @dreammonsterjp 株式会社ドリームモンスター
      Twitter 798795770581266433, -- @PRTIMES_NEWS PR TIMESニュース
      Twitter 732099555710263297, -- @81pro_official 【公式】81プロデュース
      Twitter 723058748952965120, -- @1000_pro_com ミレニアムプロ
      Twitter 4565186714, -- @youngace_up ヤングエースUP公式
      Twitter 3988316892, -- @SEGA_Ent セガ エンタテインメント公式
      Twitter 3219139634, -- @dmmolg_com DMM GAMES公式＠多田野きつね🦊
      Twitter 3143072946, -- @toki_management トキエンタテインメント
      Twitter 3075211891, -- @office_anemone オフィスアネモネ公式
      Twitter 3017102584, -- @nexon_shikyoku NEXON ツイッター支局
      Twitter 2897290963, -- @GOODROID_inc 株式会社GOODROID
      Twitter 2570344658, -- @PRTIMES_GAMES PR TIMESゲーム
      Twitter 2536582896, -- @si_notall notall official【9/1ノタFES2019主催】
      Twitter 2501907386, -- @fhana_info fhána_info
      Twitter 2471883294, -- @ysinc0419 株式会社Y's
      Twitter 2371707378, -- @shonen_Ace 少年エース
      Twitter 1966429123, -- @bushimostation ブシモ公式
      Twitter 1612407691, -- @PRTIMES_ETM PR TIMESエンタメ
      Twitter 1515207181, -- @TPD_official 東京パフォーマンスドール(TPD)
      Twitter 1275695144, -- @officeinveider オフィスインベーダー（なるせゆうせいの会社）
      Twitter 498788645, -- @bushi_PR ブシロード公式
      Twitter 468037892, -- @seganewsnavi セガプラザ公式
      Twitter 338905976, -- @Jupiter_JP1 株式会社ジュピター
      Twitter 317684165, -- @nogizaka46 乃木坂46
      Twitter 307759398, -- @SANZIGEN_INC 株式会社サンジゲン 公式アカウント
      Twitter 287226630, -- @KadokawaBunko 角川文庫編集部
      Twitter 267105383, -- @YAG_PR 代々木アニメーション学院 official
      Twitter 223330695, -- @aiddcc AID-DCC Inc.
      Twitter 177110380, -- @SEGA_OFFICIAL セガ公式アカウント
      Twitter 137263528, -- @parco_art PARCO-ART
      Twitter 132066884, -- @edge_works 株式会社エッジワークス
      Twitter 130397568, -- @ske48official SKE48
      Twitter 104742595, -- @VictorMusic ビクターエンタテインメント

      -- 配信
      -- 文化放送A&G
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCzRjtONwhrPCNNMp8hubjHg",
      Twitter 1268759836826546176, -- @UplusLIVE U+LIVE @shibuya quattro
      Twitter 930989863842676736, -- @nicoanime_PR Nアニメ&ニコニコアニメ公式🌸配信情報や🎁も!!
      Twitter 885328872253739009, -- @nicolive_PR ニコニコ生放送【ニコ生公式】
      Twitter 788637003084595200, -- @watch_UNEXT_A U-NEXTアニメ＠公式
      Twitter 710658568416985088, -- @Anime_ABEMA ABEMAアニメ(アベアニ)
      Twitter 2510743933, -- @OPENREC OPENREC【公式】
      Twitter 2383099080, -- @tbschannel TBSチャンネル
      Twitter 537147807, -- @UDO_ArtistsINC ウドー音楽事務所
      Twitter 389352575, -- @anitv_PR テレビ東京アニメ公式「あにてれ」
      Twitter 260157526, -- @watch_UNEXT U-NEXT
      Twitter 171845386, -- @onsenradio インターネットラジオステーション＜音泉＞
      Twitter 95588678, -- @cho_ag 文化放送　超！A&G
      Twitter 71779161, -- @Yahoo_GYAO GYAO!

      -- イベント
      -- リミテッドスタンドLimited Stand
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCQ7QGT_v6Si-2-i0f9mbMBQ",
      -- 手塚プロダクション公式チャンネル
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCyach7GHJDlXTv6h3fcNwqg",
      -- ゲマチャンネル
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UC_zBYH60OukiGnKSZJJxENw",
      Twitter 1214892311563210752, -- @MonkeyBay5 MonkeyBay
      Twitter 1080189433683501056, -- @adm_akiba アド街っぷPREMIUM版＠秋葉原観光マップ【公式】
      Twitter 1032488126797639680, -- @notafes ノタFES Tw 2019
      Twitter 1020143964127547392, -- @kurumi_s_g 阪本久瑠実
      Twitter 1019087758189461505, -- @GraffartC GraffArt CAFE
      Twitter 1006472416913121281, -- @smcc_card 三井住友カード
      Twitter 978555699952168961, -- @h_kawaiiya 原宿カワイーヤ
      Twitter 927737741076414466, -- @rikanenpyo_mpub 理科年表編集室
      Twitter 920176444302438400, -- @tobuzoo1981 東武動物公園【公式】あとらこ
      Twitter 832416664033452032, -- @edomaekisen もんじゃ屋形船 江戸前汽船
      Twitter 775579759417798657, -- @LimitedStand リミスタ
      Twitter 773773892628406272, -- @doubutsupeace どうぶつピース！！
      Twitter 734658118089609216, -- @marui_annex_a 新宿マルイアネックス アニメイベント
      Twitter 734578911778988032, -- @marui_anime マルイノアニメ
      Twitter 4848342680, -- @REALBBQ_info REALBBQ（リアルバーベキュー）
      Twitter 4342755799, -- @osarecompany オサレカンパニー
      Twitter 3877364172, -- @rockmatsuri ビクターロック祭り2020
      Twitter 3318554538, -- @Umabi_Official Umabi
      Twitter 3314727913, -- @mirrativ_jp ミラティブ@スマホ１台でゲームプレイ配信！
      Twitter 4298409799, -- @UNICOclub (公式)手塚治虫・ユニコ倶楽部
      Twitter 3256332042, -- @KADOKAWA_denshi KADOKAWAの電子書籍
      Twitter 2910441691, -- @donbei_jp どん兵衛　公式
      Twitter 2841101695, -- @BOOSTER_PARCO クラウドファンディング BOOSTER by PARCO & CAMPFIRE
      Twitter 2765339154, -- @animejam_staff アニメJAM2019 公式
      Twitter 2578100414, -- @kadokawa_event KADOKAWAイベント情報
      Twitter 2460887588, -- @prmag_bunka ぶんかる【文化庁公式】
      Twitter 2335919749, -- @MAFF_JAPAN 農林水産省
      Twitter 1922840634, -- @cfm_snowmiku 雪ミク（初音ミク）
      Twitter 1279230218, -- @MPD_koho 警視庁広報課
      Twitter 439752084, -- @ngt_anifes がたふぇす
      Twitter 397792279, -- @animate_cafe アニメイトカフェ総合
      Twitter 300076066, -- @lotteria_pr ロッテリア
      Twitter 286056244, -- @Kankyo_Jpn 環境省
      Twitter 263895453, -- @kankyoshosado01 環境省佐渡自然保護官事務所
      Twitter 256906707, -- @anisama Animelo Summer Live
      Twitter 144767987, -- @parcoala パルコアラ
      Twitter 133611914, -- @Tochitele とちテレ公式
      Twitter 131003836, -- @keroro_PR 【公式】ケロロ軍曹PR
      Twitter 111223135, -- @animelo_staff アニメロスタッフ
      Twitter 107025393, -- @maruzenpub 丸善出版営業部
      Twitter 88577355, -- @WWFJapan WWFジャパン
      Twitter 56906171, -- @sanrio_news サンリオ
      Twitter 11195332, -- @schatz1 シャッツキステ

      -- コラボゲーム
      Twitter 1045625907967275008, -- @ARTILIFE_jp ARTILIFE_jp
      Twitter 1040162473033195522, -- @WACCA_official WACCA 公式
      Twitter 1027427093552852992, -- @girls_creatures 【公式】ガールズ&クリーチャーズ
      Twitter 995941828766519296, -- @DNM_JP アイリーン＠ドラゴンネストM公式
      Twitter 923802830921654277, -- @kotodaman_pr 【公式】コトダマン運営会議
      Twitter 876732327598084096, -- @destinyc_info デスティニーチャイルド【公式】
      Twitter 4859102219, -- @HG_Avatar ハンゲアバター【公式】@まくも
      Twitter 2307698479, -- @shirokurojoker しろくろジョーカー公式＠じい
      Twitter 1001107099, -- @maimai_official maimai公式@7/5(金)Re:MASTER追加！
      Twitter 289206965, -- @TW_nexon テイルズウィーバー公式
      Twitter 260644393, -- @mabinogi_nexon 「マビノギ」byパン(公式)

      -- 流通
      Twitter 895195685024219137, -- @sanrioanist サンリオアニメストア公式
      Twitter 3253471304, -- @clionmarket クリオンマーケット
      Twitter 2927579576, -- @AWA_official AWA＠最新音楽トレンド
      Twitter 2692195681, -- @TVTOKYO_Shop テレ東本舗。
      Twitter 2578128852, -- @kadokawastore カドカワストア
      Twitter 2262488635, -- @COMIC_WALKER コミックウォーカーComicWalker
      Twitter 1483924628, -- @vos_jn ビクターオンラインストア【公式】
      Twitter 727636166, -- @TSUTAYAanitsuta あにツタ（TSUTAYAアニメ）
      Twitter 588119900, -- @natalie_store ナタリーストア
      Twitter 425668036, -- @mora_info 音楽配信サイト【mora】
      Twitter 389280016, -- @akiba_gema AKIHABARAゲーマーズ本店
      Twitter 198949082, -- @UNITED_CINEMAS ユナイテッド・シネマ公式
      Twitter 196049630, -- @gamers_no_gema ゲマ【株式会社ゲーマーズ】
      Twitter 131027338, -- @recochoku_jp レコチョク《コーポレートアカウント》
      Twitter 108517346, -- @shochiku_video 松竹ホームエンターテインメント
      Twitter 106343759, -- @animateinfo 株式会社アニメイト

      -- チケット
      Twitter 968083710842060801, -- @lineticket_jp LINEチケット
      Twitter 855975221181825024, -- @fanicon1 Fanicon@ファンコミュニティサービス
      Twitter 312508101, -- @eplus_anime イープラス［アニメ］
      Twitter 240201550, -- @lawson_ticket ローチケ（ローソンチケット）
      Twitter 191008495, -- @anime_pia アニメぴあ
      Twitter 119982603, -- @eplusjp イープラス
      Twitter 72193168, -- @RakutenTicket 楽天チケット
      Twitter 57282906, -- @news_pia チケットぴあ

      -- 商品
      Twitter 1085731309966610432, -- @anique_jp Anique
      Twitter 1070208213444775937, -- @kujifes くじフェス！
      Twitter 954195501280149505, -- @magi_pri_PR newlogic PR
      Twitter 945951790565961728, -- @maruman_sketch スケッチブックのマルマン
      Twitter 938958815915008000, -- @Graff_Art_ GraffArt(グラフアート)
      Twitter 908221278871478272, -- @eStream_inc eStream
      Twitter 908168953926578176, -- @dmm_scratch DMMスクラッチ
      Twitter 904957076950073346, -- @segacatcher_ol セガキャッチャーオンライン
      Twitter 846915537787469824, -- @TEZUKA_goods 【公式】手塚プロダクション・グッズ情報
      Twitter 844767518250037248, -- @shop_tokyoatom TOKYO ATOM
      Twitter 835316085884776452, -- @aqua_yokohama 株式会社AQUA公式
      Twitter 819055220290297856, -- @anipo_goods あにぽ!_アニメグッズ
      Twitter 803052956970926080, -- @yubin_jp 郵便年賀.jp
      Twitter 798116037799518208, -- @tzng100 ティーゾーン（グッズ班）
      Twitter 796926373382144000, -- @tanikawashoji 谷川商事株式会社【公式】
      Twitter 781667417512697856, -- @MXF_official マックスファクトリー 公式
      Twitter 747338829695070208, -- @bushi_creative ブシロードクリエイティブ公式
      Twitter 706495179004317696, -- @shimamura_gr ファッションセンターしまむら
      Twitter 3985727352, -- @posukuma_yubin ぽすくま【日本郵便】
      Twitter 3659076377, -- @MangaStamp MangaStamp
      Twitter 3524357058, -- @F_dot_Heart えふとも　エフドットハート
      Twitter 3270846866, -- @AMNIBUS AMNIBUS（アムニバス）
      Twitter 3180871603, -- @kuromimi0602 にゃｰ@シープラ公式【情報局】
      Twitter 3095919481, -- @teambellhouse ベルハウス@公式
      Twitter 3062498185, -- @hgcharacter ヒサゴ キャラクターグッズ
      Twitter 2583762356, -- @A3_CharaCharge 株式会社A3
      Twitter 2312702190, -- @emuzu100 エムズファクトリー
      Twitter 2278971126, -- @kbooks_collabo kbooks_collabo
      Twitter 1535442409, -- @happypriroll プリロール公式（キャラケーキ＆マカロン）
      Twitter 1375795710, -- @hna_d （株）エイチ・エヌ・アンド・アソシエイツ
      Twitter 1322154672, -- @GuruGare GrooveGarage（グルーヴガレージ）
      Twitter 1309338816, -- @aurora_ltd 株式会社アウローラ
      Twitter 806644010, -- @minnanokuji みんなのくじ【フリュー公式】
      Twitter 715491090, -- @showanote ショウワノート
      Twitter 587243626, -- @HappyKuji Happyくじ
      Twitter 547299604, -- @gsc_kahotan カホタン＠グッスマのすみっこ
      Twitter 532861788, -- @se_pla シーズナルプランツ【痛傘】公式
      Twitter 369322470, -- @MF_GoodsNavi えむえふGoodsNavi
      Twitter 350694195, -- @candytoy_c バンダイ キャンディ【公式】
      Twitter 214883200, -- @flowstarsilver フロースター
      Twitter 189895669, -- @shiraitoshuzo 白糸酒造（株）
      Twitter 185038320, -- @kaiyodo_PR 株式会社海洋堂
      Twitter 138685355, -- @ebten エビテン【ebten】
      Twitter 135113118, -- @nijigencospa 二次元コスパ
      Twitter 131011023, -- @maplus_navi MAPLUS（マップラス)　広報担当【公式】
      Twitter 104989854, -- @DARTSHiVe ダーツハイブ / DARTS HIVE 【公式】
      Twitter 91081573, -- @ichibanKUJI 一番くじ（BANDAI SPIRITS）
      Twitter 89142182, -- @famima_now ファミリーマート
      Twitter 70622589, -- @amiami_figure あみあみ
      Twitter 68864104, -- @gsc_goodsmile グッドスマイルカンパニー【公式】
      Twitter 58709764, -- @charaani キャラアニ【公式】
      Twitter 5713232, -- @cospa COSPA（コスパ）
    ],
  },
  -- はなまるうどん
  Rule::{
    filter = Some Filter::{ title = basicFilterMinusHanamaru },
    outbox = [Outbox.Twitter pipitor],
    topics = [
      Twitter 100358790, -- @hanamaru_udon 【讃岐】はなまるうどん
    ],
  },
  -- プレス
  Rule::{
    filter = Some Filter::{ title = basicFilter },
    exclude = Some Filter::{
      title = basicExclude
        ++ "|" ++ ix "おはようSGI" -- @SocialGameInfo のダイジェスト
        ++ "|" ++ ix "news.nicovideo.jp" -- ニコニコニュースのキュレーション系記事
    },
    outbox = [Outbox.Twitter pipitor],
    topics = [
      -- インサイド＆Game*Spark動画チャンネル
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCkU6nDHWQpyDK5vw9YSYjLw",
      -- 4GamerSP
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCfIgNVCiAei8r-haGHDnedg",
      -- ファミ通App
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCcxj8uiQUeSfMHLy_Sk8FhA",
      -- 電撃オンライン
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UCQb6W0vblp5ewU75watnqQQ",
      -- gamernejp
      Feed "https://www.youtube.com/xml/feeds/videos.xml?channel_id=UC2aiZm7FsZFwhbPNWpjJcZQ",
      Twitter 1115426897335185409, -- @music_ups フリーマガジン『music UP's』
      Twitter 1103471129358823424, -- @anison_nhk anison_nhk
      Twitter 909951337382547457, -- @anirecoTV あにレコTV
      Twitter 854165601148837888, -- @AnimeTourism88 アニメツーリズム協会　じゅんれいちゃん
      Twitter 737923441198825473, -- @ABEMATIMES ABEMA TIMES
      Twitter 4125172272, -- @spice_stage SPICE[舞台情報メディア]／e＋
      Twitter 4121959099, -- @spice_anige SPICE[アニメ・ゲーム情報メディア]
      Twitter 4121824154, -- @spice_mu SPICE[音楽情報メディア]／e＋
      Twitter 3444137113, -- @gamewith_review GameWith@最新ゲーム情報局
      Twitter 3314647279, -- @tvtokyo_plus テレ東プラス
      Twitter 3196198694, -- @spice_topics SPICE[エンタメ情報メディア]/e＋
      Twitter 2678790127, -- @tospo_prores 東スポ
      Twitter 2678707854, -- @ANIPLUSAsia ANIPLUS Asia
      Twitter 1712084484, -- @rankingbox ランキングBOX編集部
      Twitter 1501970341, -- @realsoundjp Real Sound（リアルサウンド）
      Twitter 1410007399, -- @musicvoicejp MusicVoice - ミュージックヴォイス公式
      Twitter 518473614, -- @cho_animedia アニメ＆声優関連ニュースサイト「超！アニメディア」公式アカウント
      Twitter 424711987, -- @musicru_tv musicるTV【公式】
      Twitter 340032591, -- @repotama れポたま！
      Twitter 304976428, -- @iid_animedia アニメディア編集部
      Twitter 298410252, -- @GamerNeJp Gamer＠ゲーム情報
      Twitter 202998073, -- @nico_nico_news ニコニコニュース
      Twitter 148966859, -- @anicanjp アニカンドットジェイピー
      Twitter 142583957, -- @Billboard_JAPAN Billboard JAPAN
      Twitter 131032996, -- @animatetimes アニメイトタイムズ公式
      Twitter 128275735, -- @akiba_kakakucom アキバ総研公式
      Twitter 127920793, -- @SocialGameInfo SocialGameInfo
      Twitter 121467814, -- @famitsuApp ファミ通App@アプリ新作情報
      Twitter 97679405, -- @gekirock 激ロック
      Twitter 95577986, -- @game_watch GAME Watch
      Twitter 70665177, -- @walkerplus_news ウォーカープラス
      Twitter 49540955, -- @mainichi 毎日新聞
      Twitter 46656365, -- @antch ニュータイプ編集部／WebNewtype
      Twitter 44306171, -- @4GamerNews 4Gamer
      Twitter 33482896, -- @dengekionline 電撃オンライン
      Twitter 27535070, -- @INSIDEjp インサイドさん
      Twitter 24172196, -- @mantanweb MANTANWEB (まんたんウェブ)
      Twitter 18622184, -- @comic_natalie コミックナタリー
      Twitter 5921162, -- @famitsu ファミ通.com
      Twitter 5649672, -- @natalie_mu 音楽ナタリー
    ],
  },
  Rule::{
    filter = Some Filter::{ title = basicFilter},
    exclude = Some Filter::{ title = basicExclude ++ "|🏆|アンケート" }, -- アンケート記事
    outbox = [Outbox.Twitter pipitor],
    topics = [
      Twitter 456544724, -- @AnimeAnime_jp アニメ！アニメ！
    ],
  },
  -- スタッフ・キャスト
  Rule::{
    filter = Some Filter::{ title = individualFilter },
    outbox = [Outbox.Twitter pipitorIndv],
    topics = [
      Twitter 1314640424062001152, -- @ssk_ktk828 佐々木琴子 公式
      Twitter 1210889093124505600, -- @_Amane_Kanon_ 天希かのん
      Twitter 1184389242761310208, -- @youmiya_hina 羊宮妃那
      Twitter 1129194500365070336, -- @NINMiO_APT 二宮みお
      Twitter 1153920859578331136, -- @izm_tako 和泉風花
      Twitter 1141319903250534400, -- @kitoakari_1016 鬼頭明里
      Twitter 1134589498610802688, -- @eino_airi_staff 永野愛理 スタッフ【公式】
      Twitter 1126735473102090240, -- @YUI_STAFF 石川由依Official
      Twitter 1125555085067505664, -- @Anna_Mihayashi 御林杏夏
      Twitter 1123177804114190336, -- @kaayaataaaan 奥野香耶
      Twitter 1120670106617384960, -- @shiraki_riho 白木莉帆（タートルリリー）
      Twitter 1118785839130009600, -- @romipark_fc 朴璐美 Official Staff
      Twitter 1113758206436622336, -- @yoshioka_mayuC 吉岡茉祐
      Twitter 1113445785004269568, -- @minazou_373 田中美海
      Twitter 1082826501609799680, -- @misawa_official 三澤 紗千香(みさわ さちか)official
      Twitter 1054520180032778241, -- @kannmadoka 菅 まどか
      Twitter 1048871638651924480, -- @yagimashiro 八木 ましろ
      Twitter 1045274084743860224, -- @_shio_asuka 汐入 あすか
      Twitter 1043684232097218560, -- @Joey_Takeda 武田城以
      Twitter 1024177131918508032, -- @yukiyofujii0508 藤井ゆきよ
      Twitter 1016599143584681989, -- @mo_chaam 元吉有希子
      Twitter 1012251656384155648, -- @hasegawa_rimo 長谷川里桃
      Twitter 1011171132622319616, -- @yuukikana_0u0 優木かな
      Twitter 1003903172044251137, -- @elfinHanafusa_R 花房里枝
      Twitter 998755439234830342, -- @kyoka_yuuki 京花優希(きょうかゆうき)
      Twitter 997057929541963776, -- @akao_hikaru 赤尾ひかる🐣
      Twitter 988759882974216194, -- @morisita_suu 森下suu
      Twitter 987227622416334848, -- @Weeeda_I 上田瞳
      Twitter 980800152553209857, -- @hyamazaki_staff 山崎はるかStaff
      Twitter 975386499033137152, -- @shinnosukenuma 沼田心之介／地方創生クリエイター
      Twitter 968014659214192640, -- @shiroshironao 白城なお(しらきなお)
      Twitter 961655526466633728, -- @amatsuuni_staff あま津うに amatsuuni 【公式】
      Twitter 957177496759185408, -- @hina_suguta 直田姫奈＊すぐたひな
      Twitter 953901292849541120, -- @sakiho_46 本西彩希帆
      Twitter 953874636759945221, -- @hinata_k0110 小泉日向
      Twitter 951092245762945024, -- @ygnm_kana やぎぬまかな
      Twitter 950661835123867648, -- @takahashi_773 高橋菜々美
      Twitter 938719807255461888, -- @kaori_staff_ 石原夏織 STAFF
      Twitter 936189651630546947, -- @yahagi_sayuri 矢作紗友里
      Twitter 922067394721234946, -- @hikaru_tono 遠野ひかる
      Twitter 918281358832574464, -- @azuma_lim アズマリム＠MV50万回再生ありがとぉー！
      Twitter 907051478166020096, -- @705shirakami 白神直子　しらかみなおこ
      Twitter 897009717100240896, -- @saitou_kiara 齋藤 樹愛羅
      Twitter 897002191319216128, -- @otani_emiri 大谷 映美里
      Twitter 896994847726247936, -- @morohashi_sana 諸橋 沙夏
      Twitter 896994042843549696, -- @noguchi_iori 野口 衣織
      Twitter 896990803481960448, -- @yamamoto_anna_ 山本 杏奈
      Twitter 896984504182517760, -- @saito_nagisa 齊藤 なぎさ
      Twitter 896934255346851842, -- @shoko_takiwaki 瀧脇 笙古
      Twitter 896933658816204802, -- @takamatsuhitomi 髙松 瞳
      Twitter 896933181466697728, -- @satake_nonno 佐竹 のん乃
      Twitter 896932241615355904, -- @sasaki_maika 佐々木 舞香
      Twitter 896931218024878080, -- @otoshima_risa 音嶋 莉沙
      Twitter 896928183861223424, -- @hana_oba 大場 花菜
      Twitter 887533724853608448, -- @monsoyama 祖山桃子(もんが) /声優です。
      Twitter 880621944101404672, -- @kaor1n_n 前田 佳織里
      Twitter 870511887754027008, -- @elfinTsujiMiyuu 辻 美優（elfin'）
      Twitter 869862112037814272, -- @hazuki_nonaka 野中 遥月
      Twitter 869793837266288645, -- @tsutsumi_yukina 堤 雪菜
      Twitter 867729793424347136, -- @tasaki0308 田崎礼奈🥜
      Twitter 864554567505027072, -- @ShowMirai_music ミライショウ
      Twitter 854925939565776896, -- @_ayase_yu 綾瀬有
      Twitter 853074336248340481, -- @PA___NON PA-NON＆STAFF
      Twitter 840559363576102913, -- @eri1717171 久遠エリサ
      Twitter 838223630853033984, -- @canari_1111 あまり かなり7/4～音楽劇ジップ&キャンディ🤖7/29～舞台pet🐠8/21～舞台コジコジ😺
      Twitter 838047638314348544, -- @eri_usagi_ 河上 英里子
      Twitter 836824793521537024, -- @momokawa_rika 桃河りか
      Twitter 825270189264506880, -- @reina_kondo 近藤玲奈
      Twitter 814328637407264769, -- @Matsurica_staff マツリカ団
      Twitter 811124387495616512, -- @ibuking_1114 木戸衣吹
      Twitter 802124249628409856, -- @rui_harinezumi 苅谷瑠衣
      Twitter 787531199895920640, -- @tamura_kyoka 田村響華
      Twitter 767928161153654784, -- @Arisa_Aihara_ 愛原ありさ
      Twitter 771620400044265472, -- @fujisanyuui 藤山由依
      Twitter 766912527368228864, -- @MachicoOfficial Machico Official
      Twitter 760025194383585280, -- @Takase_Aiko 高瀬愛虹（たかせあいこ）
      Twitter 749885881318727681, -- @numakura_manami 沼倉愛美
      Twitter 748671603127398400, -- @aibaaiai 相羽あいな
      Twitter 737989496365449217, -- @InfoItomiku 伊藤美来 公式info
      Twitter 730754632062898176, -- @nagatsumajuri 長妻樹里
      Twitter 729856832097783808, -- @mako_komaki 小槙まこ
      Twitter 725372244982042625, -- @akari_w_tpd 脇あかり(TPD)
      Twitter 715373955041796096, -- @tomoyo_t_1014 高柳知葉
      Twitter 709265233399787520, -- @Yurie_Funato 船戸ゆり絵
      Twitter 4803314774, -- @spspring1234 伏見はる香
      Twitter 4777230254, -- @staff_rie 村川梨衣 音楽スタッフ公式
      Twitter 4684249872, -- @NOGUMAOMIN 野口 真緒
      Twitter 4265387958, -- @piyosuuuuu 都築里佳
      Twitter 4263104894, -- @ozaki_yuka515 尾崎由香
      Twitter 4110103573, -- @k_moeka_ 小泉萌香
      Twitter 4065828913, -- @Kanako_tktk 高槻かなこ
      Twitter 3956675652, -- @rikachimalu 長江 里加(リカチマル)
      Twitter 3611987292, -- @mn0914nm 西川 美咲
      Twitter 3523132154, -- @roudokuya_dajai 桑島法子（朗読夜＠国分寺チケット発売中！)
      Twitter 3320082001, -- @miyajima_jun ミヤジマジュン
      Twitter 3293336932, -- @machauq 和多田美咲
      Twitter 3241351399, -- @takemoto_taizo 竹本泰蔵
      Twitter 3221101608, -- @aki_lucky1216 関根 明良
      Twitter 3191805905, -- @yukachiofficial 井口裕香 ワーナーOfficial
      Twitter 3180858356, -- @K_Rico1_1 小池理子
      Twitter 3149720330, -- @ayaMiNTgreen 山根 綺
      Twitter 3111919296, -- @Aya27songe 清水 彩
      Twitter 3108574016, -- @ogino_hazuki 荻野 葉月
      Twitter 3071098621, -- @EPsqqoSl38iCI3i 前田綾香
      Twitter 2952943278, -- @tkdnomasahiro 武田 将弥
      Twitter 2951837336, -- @minami_shinoda 篠田みなみ
      Twitter 2950212426, -- @0311asaki 4s4ki
      Twitter 2917014519, -- @kaedexmaple 奥谷 楓
      Twitter 2897674771, -- @kanekosanndesu 金子有希 シーズン2
      Twitter 2897481228, -- @gyogyo0301 美波わかな
      Twitter 2856418760, -- @katorihona_mg 加藤里保菜スタッフ Kato Rihona staff
      Twitter 2835421412, -- @rihonyan103 加藤里保菜
      Twitter 2830750813, -- @motomiyakana 本宮佳奈
      Twitter 2826329041, -- @jinko_moe 甚古 萌
      Twitter 2665092121, -- @maruasahina 朝日奈丸佳
      Twitter 2640398808, -- @nonremuq 石井玲歌
      Twitter 2596481180, -- @Lynn_0601_ Ｌｙｎｎ (りん)
      Twitter 2587770060, -- @okome_satomai 佐藤 舞🌾🍚
      Twitter 2574392995, -- @nagaku_yuki 長久友紀@がっきゅ
      Twitter 2574385454, -- @yuri_nogu のぐちゆり
      Twitter 2570625481, -- @bknb_mew みゆはん
      Twitter 2548258832, -- @deet_ic 馬場莉乃
      Twitter 2471285462, -- @jullie_egg 木村珠莉
      Twitter 2445518118, -- @takamori_723 高森奈津美
      Twitter 2384778510, -- @iRis_s_yu 芹澤優(i☆Ris)
      Twitter 2365137780, -- @morita_suzuka 森田涼花
      Twitter 2308569924, -- @hinappp8 木野日菜
      Twitter 2293843940, -- @andyll25252 安藤尚也🦔
      Twitter 2292118700, -- @OnoSaki1126 小野 早稀(おの さき)
      Twitter 2275197806, -- @ckik195 築田行子
      Twitter 2237565500, -- @ohagidaisuki226 田口実加
      Twitter 2203143757, -- @nojomiy 山本希望
      Twitter 2186330749, -- @michuell_bunny 未来みき＊大天使みしゅえる⸜(´ ˘ `∗)⸝🔥
      Twitter 2171654186, -- @EggLuv07 柳原 かなこ
      Twitter 2168328588, -- @Ma2Ndayodayo 松尾祐輔
      Twitter 1968534385, -- @Galsyumcr SYU
      Twitter 1662016370, -- @karin_takahashi 高橋花林
      Twitter 1604926548, -- @NomotoHotaru 野本ほたる
      Twitter 1536485510, -- @nkysyk_a 仲谷明香（なかやさやか）
      Twitter 1529614860, -- @akariuehara13 上原あかり🐰🍳
      Twitter 1493773717, -- @rg8270fvv 高田 翼
      Twitter 1451261143, -- @honami0723 ほなみ
      Twitter 1443275232, -- @neeeruuu 根本流風
      Twitter 1408066855, -- @toyotamoe 豊田萌絵
      Twitter 1363724040, -- @marika_0222 高野 麻里佳（こうの まりか）
      Twitter 1351192345, -- @owada_hitomi 大和田仁美
      Twitter 1349665898, -- @kawakami_rio 川上莉央
      Twitter 1341436316, -- @sunflower930316 高田 憂希( Yuuki Takada )
      Twitter 1220770466, -- @Saeri_Umehara 梅原サエリ
      Twitter 1171485145, -- @__YESxxNO__ タマキ♛︎らいちざうるす🦖
      Twitter 1136351120, -- @Haruka26s 🐳 佐藤 遥
      Twitter 1079666190, -- @miiiiiina_cat 高橋未奈美
      Twitter 1067613817, -- @39_miku_1012 吉川未来
      Twitter 1053303781, -- @yamamoto_ayk 山本文香
      Twitter 1045524721, -- @osorasan703 大空直美
      Twitter 1023577651, -- @Sada481220 森貞文則
      Twitter 989980122, -- @Ma_ri_ya_i 伊瀬茉莉也🍋Mariya Ise
      Twitter 949456508, -- @E_llery3110 齋藤 小浪
      Twitter 901539650, -- @holy_kobayashi 小林ゆう_公式
      Twitter 860869646, -- @RyokoShiraishi_ 白石涼子
      Twitter 849626744, -- @tghgworks_krsy 烏屋茶房/カラスヤサボウ
      Twitter 755223967, -- @Akina_1102 秋奈
      Twitter 715016365, -- @Carin_Official 礒部花凜 official
      Twitter 595126798, -- @KaoruHayano1212 早乃香織🎠Kaoru Hayano
      Twitter 562517449, -- @honda_mosamosa 本多真梨子
      Twitter 546607939, -- @chunrip08 新橋 和
      Twitter 521006849, -- @yamashita_mami 山下まみ@まみみ
      Twitter 519622892, -- @azsainamura 稲村梓
      Twitter 518164105, -- @kota_h0307 橋本 孝太
      Twitter 506310004, -- @miwafurusan 古庄 美和
      Twitter 457559943, -- @sakai_ran 酒井蘭
      Twitter 456424628, -- @wataru_sena 瀬名航 / Wataru Sena
      Twitter 442847857, -- @s_u_music s.uchida
      Twitter 442644970, -- @totetonkoide 小出裕也
      Twitter 440252533, -- @RiccaTachibana 立花理香
      Twitter 431544187, -- @sarara_ya 八島さらら
      Twitter 394994233, -- @kanek0mayumi 金子麻友美
      Twitter 374582749, -- @incidentsTF 風来坊 伊山
      Twitter 367514058, -- @ko_yuli 幸野ゆりあ🍎
      Twitter 340785466, -- @yuuka_aisaka 相坂優歌official
      Twitter 306818664, -- @DApanda323 松田颯水。
      Twitter 301999903, -- @ReSAEnter 松田利冴。
      Twitter 297833968, -- @aya_uchida 内田彩
      Twitter 296215278, -- @kesaaaaaaaaaan 毛蟹
      Twitter 293979493, -- @info_akechi 佐藤朱
      Twitter 284418607, -- @UMEMOMOKA 庄司宇芽香
      Twitter 282612434, -- @SaiToShiN16 斎藤真一郎
      Twitter 280365265, -- @aimausu 加隈亜衣(かくまあい)
      Twitter 277151040, -- @tatsuhiromiwa 三輪達宏
      Twitter 276899386, -- @rica_matsumoto3 🌈✨松本梨香✨🌈
      Twitter 267623798, -- @romiansaran 朴璐美
      Twitter 264647686, -- @Masayoshi_Oishi 大石昌良【オーイシマサヨシ】
      Twitter 253085057, -- @jin_jin_suruyo じん
      Twitter 251960614, -- @no_my_ ノーマイ/no_my (作曲家/経営者)
      Twitter 250212248, -- @Tsubasacurry 伊藤 翼/Tsubasa Ito(作曲家)
      Twitter 246724637, -- @natsumikan0804 宮本奈津美
      Twitter 244788445, -- @mikoiwate_351 佐々木未来
      Twitter 242639532, -- @shiori_izawa 井澤詩織
      Twitter 237804402, -- @Koike_Tatsuya TATSUYA KOIKE 小池龍也
      Twitter 232229151, -- @Suwa_Ayaka 諏訪彩花
      Twitter 217057116, -- @eyewater_e 榎木ともひでWF5-02-01
      Twitter 214686961, -- @yuka_s1113 斉藤佑圭
      Twitter 214008178, -- @flyco_ フライ
      Twitter 213641001, -- @akemikanda 神田朱未
      Twitter 199932799, -- @mikami_shiori 三上枝織
      Twitter 197317743, -- @ikkichihiro いっき ちひろ(一木千洋)@声優YouTuber
      Twitter 196454639, -- @chiaking58 たかはし智秋
      Twitter 195162154, -- @rarirurestn 野中藍 ラリルれ、エブリバディ。
      Twitter 194653874, -- @ai_max 前田 愛•AiM ベストアルバム発売中
      Twitter 183905143, -- @EBATO_DQT 電ちょもEBATO
      Twitter 173807624, -- @adacchee 足立梨花
      Twitter 169383822, -- @moenoxxx 仁藤萌乃
      Twitter 167277356, -- @WAN_OPO ワンオポ/新曲投稿5/17
      Twitter 165028770, -- @yamazaki_haruka 山崎はるか
      Twitter 161731418, -- @btrstaff 本間翔太
      Twitter 160216958, -- @RiEmagic 村川 梨衣
      Twitter 158706245, -- @_towana towana /とわな
      Twitter 158297883, -- @yosRRX 吉崎 観音
      Twitter 155583210, -- @Gibson_Mitsuya 三矢禅晃
      Twitter 155514166, -- @uwaemi 宇和川 恵美@LINEスタンプ えみぞー
      Twitter 154744353, -- @tokyo_cs 松野恭平(TCS/DogP)
      Twitter 154533662, -- @moririnmonson 相沢舞 Mai Aizawa
      Twitter 145158766, -- @atmanbow_staff 井上喜久子(Kikuko Inoue)&スタッフ
      Twitter 144164783, -- @tanishisuki 松原タニシ
      Twitter 140727714, -- @kaos_office kaos
      Twitter 133627014, -- @tsvaci 辻林 美穂
      Twitter 133146525, -- @nobutx_0517 細谷伸之
      Twitter 129061096, -- @higedriver ヒゲドライバー
      Twitter 127168080, -- @nanami_eiko 七海 映子
      Twitter 124205624, -- @emon316 emon(Tes.)
      Twitter 124061259, -- @ErikoMatsui 松井 恵理子
      Twitter 123404041, -- @okame_hara 原 彩弓
      Twitter 116459830, -- @YooNakamura 中村友
      Twitter 114700374, -- @mimori_suzuko 三森すずこ
      Twitter 112139029, -- @asamingosu 今井麻美
      Twitter 111187922, -- @Daisuke_P だいすけP
      Twitter 110996822, -- @kanoyui1222 鹿野優以
      Twitter 109871522, -- @masumi_asano 浅野真澄@あさのますみ
      Twitter 104357751, -- @HiRoMi_ig 五十嵐裕美(いがらしひろみ)
      Twitter 102297672, -- @futoshi_ocsf あらいふとし
      Twitter 99689625, -- @keisukeshami 伊藤ケイスケ　Keisuke Ito
      Twitter 96355490, -- @40mP 40mP／イナメトオル
      Twitter 94595949, -- @rapbit_rapstar らっぷびと
      Twitter 93666200, -- @sugarboykiller 川尻恵太
      Twitter 90197617, -- @GYARI_ GYARI
      Twitter 84625899, -- @sasakure__UK sasakure.UK
      Twitter 71761708, -- @YoshieIsogai 磯谷佳江
      Twitter 69606376, -- @RYUKNIGHT 内藤隆 @漫画版けもフレ２①発売中!!
      Twitter 59796971, -- @takuyakusunose 楠瀬"poco"タクヤ【月蝕會議・Rest of Childhood・MIMIZUQ・スクランブルズ
      Twitter 59719372, -- @NTRcap いんどなめこ@交響アクティブNEETs
      Twitter 57515919, -- @kona_milo キクチミロ
      Twitter 55920839, -- @easypop_betti EasyPop/BETTI
      Twitter 53557481, -- @yuzuruu 柚木涼香
      Twitter 51498481, -- @Ryuichi_Kimura 木村　隆一
      Twitter 44085626, -- @kazuaki518 松田 和彬（まっつん）
      Twitter 42816253, -- @MatsuuraHiroaki 松浦裕暁 @ サンジゲン！
      Twitter 42419516, -- @SiZK_STARGUiTAR SiZK
      Twitter 37376144, -- @jsato_FLEET 佐藤純一 Junichi Sato【fhána】
      Twitter 35752873, -- @takayuki_chiba 千葉高雪/A-worth
      Twitter 17343387, -- @halyosy halyosy(はるよし)晴義✍️
    ],
  },
  -- 日英バイリンガルアカウント（個人）の日本語投稿
  Rule::{
    filter = Some Filter::{ title = hash individualFilterJa },
    outbox = [Outbox.Twitter pipitorIndv],
    topics = bilingualIndvAccts,
  },
  -- English posts from en/ja bilingual accounts (individual)
  Rule::{
    filter = Some Filter::{ title = hash individualFilterEn },
    -- 多重リツイートの抑止。日本語を優先する
    exclude = Some Filter::{ title = hash individualFilterJa },
    outbox = [Outbox.Twitter pipitorIntl],
    topics = bilingualIndvAccts,
  },
  Rule::{
    filter = Some Filter::{ title = basicFilter ++ "|吉崎\\s*観音|吉崎先生" },
    outbox = [Outbox.Twitter pipitor],
    topics = [
      -- JAZA系（正会員）
      Twitter 1319835095381889026, -- @kaminepark かみね公園【公式】
      Twitter 1278246912861208577, -- @kobe_netshop 神戸どうぶつ王国　売店ラブバード・ネットショップ【公式】
      Twitter 1186801617288384512, -- @TZPS_EduCenter 東京動物園協会教育普及センター
      Twitter 1159364299866820608, -- @ZOORASIA_office 【公式】横浜市立よこはま動物園 ズーラシア
      Twitter 1153906257129959425, -- @gunmasafari 群馬サファリパーク（公式）
      Twitter 1136180695913586689, -- @tobuzoo_info 東武動物公園【公式】
      Twitter 1135423422639423489, -- @marine_uminaka マリンワールド海の中道【公式】
      Twitter 1134695072614690817, -- @kumamotocityzoo 熊本市動植物園(公式)
      Twitter 1116565680604606465, -- @noichizoo_staff 高知県立のいち動物公園
      Twitter 1106384693392375809, -- @obihirozoo おびひろ動物園[公式]
      Twitter 1088622845620498433, -- @hama_midori （公財）横浜市緑の協会公式
      Twitter 1086085674841780224, -- @seaparadise_ag 横浜・八景島シーパラダイス公式 アニメ/ゲーム部
      Twitter 1076317646692376576, -- @hamurazoo_ 羽村市動物公園
      Twitter 1049502497117626369, -- @JELLYFISHAQ 鶴岡市立加茂水族館
      Twitter 1036795766008729601, -- @Toyota_city_PR 豊田市公式
      Twitter 1023425633496358912, -- @tokiwazoo ときわ動物園（公式）
      Twitter 1021638876287225856, -- @miyajima_aqua 宮島水族館【公式】
      Twitter 1019052580415000576, -- @kofu_yuki_zoo 甲府市遊亀公園附属動物園　公式ツイッター
      Twitter 986861615545892864, -- @saitamazoo_tw 埼玉県こども動物自然公園
      Twitter 986404434514100225, -- @nhdzoo_szga 静岡市動物園協会【公式】
      Twitter 956017993963667457, -- @kaiyohakukoen 海洋博公園・沖縄美ら海水族館
      Twitter 928203645719429120, -- @toyamafamipa 富山市ファミリーパーク【公式】
      Twitter 924900426398416897, -- @shimamarineland 志摩マリンランド(公式)
      Twitter 914767453720215552, -- @_umigatari_ 上越市立水族博物館 うみがたり
      Twitter 905304850040201216, -- @seibutuen_info 足立区生物園
      Twitter 895507390992232448, -- @marinepia_2 新潟市水族館マリンピア日本海PR
      Twitter 893018992411000832, -- @tobezooofficial 愛媛県立とべ動物園【公式】
      Twitter 882213989890965504, -- @englandhill_zoo イングランドの丘 動物スタッフ【公式】
      Twitter 870198495344345088, -- @kobeojizoo 神戸市立王子動物園（公式）
      Twitter 854862220764749824, -- @nishiyama_zoo 鯖江市西山動物園
      Twitter 839321180351836160, -- @nhdzoo 静岡市立日本平動物園
      Twitter 830067318755438592, -- @echiaqua 越前松島水族館
      Twitter 812174717268332544, -- @omutacityzoo 【公式】大牟田市動物園 Omuta City Zoo
      Twitter 804867003156611072, -- @shibukawamarine 渋川マリン水族館
      Twitter 800216648468680706, -- @umitamago_staff 大分マリーンパレス水族館「うみたまご」
      Twitter 795841508343590912, -- @_aquapark_ マクセル アクアパーク品川公式
      Twitter 795140108429078528, -- @NagasakiPengin 長崎ペンギン水族館【公式】
      Twitter 763970035983405056, -- @sendaisiyagiya 八木山動物公園フジサキの杜【公式】
      Twitter 748306855147896832, -- @FukuyamaZoo 福山市立動物園[公式]
      Twitter 747292851608838145, -- @Uchicchii うちっちー【公式】
      Twitter 745975615921106945, -- @bananawanien02 熱川バナナワニ園
      Twitter 745788914363883520, -- @f_botanical 福岡市植物園
      Twitter 737841230273355776, -- @non_hoi_park 豊橋総合動植物公園（豊橋のんほいパーク）
      Twitter 735319773928685569, -- @katurahama_aq 桂浜水族館 公式
      Twitter 733945923542212608, -- @fuji_safari1980 富士サファリパーク公式
      Twitter 732473190371319808, -- @j_monkeycentre 日本モンキーセンター（公式）
      Twitter 724527309487628289, -- @kyotoshidoubut1 京都市動物園（公式）
      Twitter 717601894781222914, -- @obizoo_tanken おびひろ動物園探検隊
      Twitter 708854463331569664, -- @tokushima_city 徳島市（公式）
      Twitter 4830514909, -- @iseseaparadise 伊勢シーパラダイス【公式】
      Twitter 3302950393, -- @suzakazoo 須坂市動物園【公式】
      Twitter 3256246122, -- @ChikozanZoo 智光山公園こども動物園【公式】
      Twitter 3248460727, -- @NIFREL_official NIFREL（ニフレル）公式
      Twitter 3184029560, -- @InawashiroAQ アクアマリンいなわしろカワセミ水族館
      Twitter 3172153638, -- @chibazoo1985 【千葉市動物公園】森のレストラン＆オフィシャルショップ
      Twitter 3131486945, -- @aquariumshimoda 下田海中水族館
      Twitter 2982442993, -- @asa_zoo 広島市安佐動物公園【公式】
      Twitter 2973574466, -- @kobe_doubutsu 神戸どうぶつ王国
      Twitter 2933273814, -- @marinepark_nixe 登別マリンパークニクス
      Twitter 2751336146, -- @marudou_fan マルヤマン＠円山動物園（公式）
      Twitter 2731367606, -- @saitamaaqua さいたま水族館・羽生水郷公園【公式】
      Twitter 2588608866, -- @beachland2000 南知多ビーチランド【公式】
      Twitter 2331401946, -- @higashiyamapark 名古屋市東山動植物園
      Twitter 2316749971, -- @asahiyamazoo1 旭川市旭山動物園［公式］
      Twitter 2311169834, -- @HcpSafari 姫路セントラルパーク☆サファリ[公式]
      Twitter 2248329013, -- @ooshimashicho 東京都大島支庁
      Twitter 1966885626, -- @Sumida_Aquarium すみだ水族館【公式】
      Twitter 1856642136, -- @hekinankoho 碧南市広報
      Twitter 1684550180, -- @elpha_zounokuni エルファ＠市原ぞうの国
      Twitter 1466345528, -- @fukuokazoo 福岡市動物園
      Twitter 1365609534, -- @hirakawazoo 鹿児島市平川動物公園
      Twitter 1293811862, -- @iwatesafari 岩手サファリパーク
      Twitter 1230467258, -- @Kyoto_Aquarium 京都水族館【公式】
      Twitter 1196106666, -- @LOVE_IKEDAZOO 【公式】池田ZOO（池田動物園）
      Twitter 1156741970, -- @InokashiraZoo 井の頭自然文化園［公式］
      Twitter 1156728812, -- @KasaiSuizokuen 葛西臨海水族園［公式］
      Twitter 1156726849, -- @TamaZooPark 多摩動物公園［公式］
      Twitter 1156713230, -- @UenoZooGardens 上野動物園［公式］
      Twitter 1076058583, -- @TokyoZooNet_PR 東京ズーネット［公式］
      Twitter 1023628381, -- @HitachiCity_Zoo 日立市かみね動物園〔公式〕
      Twitter 777973105, -- @akitacity 秋田市役所
      Twitter 748494854, -- @kamoseaOfficial 鴨川シーワールド
      Twitter 700437200, -- @aki_safariland 秋吉台サファリランド
      Twitter 615913517, -- @omoriyama_zoo 秋田市大森山動物園
      Twitter 602436204, -- @ChibaZoo 千葉市動物公園【公式】
      Twitter 587130728, -- @ichikawa_zoo 市川市動植物園（公式）
      Twitter 579452660, -- @_seaparadise_ 横浜・八景島シーパラダイス公式
      Twitter 565474632, -- @aws_official アドベンチャーワールド 公式
      Twitter 543220054, -- @moriokazoo 盛岡市動物公園 ZOOMO
      Twitter 536976698, -- @nogeyamazoo401 横浜市立野毛山動物園≪公式≫
      Twitter 532950800, -- @kanazawazoo317 横浜市立金沢動物園【公式】
      Twitter 504224650, -- @england_hill イングランドの丘【公式】
      Twitter 464487269, -- @ngsbiopark 長崎バイオパーク公式
      Twitter 437332642, -- @TOBA_AQUARIUM 鳥羽水族館（TOBA　AQUARIUM）
      Twitter 424030054, -- @okazaki_koho 岡崎市広報
      Twitter 423161010, -- @HitachiCityKoho 日立市【公式】
      Twitter 409071079, -- @tamano_PR 玉野市PR情報
      Twitter 365224501, -- @itozu_zoo 到津の森公園
      Twitter 359257920, -- @aquamarinestaff 【公式】アクアマリンふくしま
      Twitter 354736890, -- @yomiuriland_com よみうりランド遊園地【公式】
      Twitter 348237596, -- @edogawa_city 東京都江戸川区
      Twitter 303054366, -- @africansafari1 アフリカンサファリ【公式】
      Twitter 301940091, -- @zounokuninet 市原ぞうの国オフィシャルストア
      Twitter 299990024, -- @Sunshine_Aqua サンシャイン水族館
      Twitter 286018618, -- @izu_anikin 伊豆アニマルキングダム
      Twitter 277861096, -- @kawasaki_pr 川崎市シティプロモーション
      Twitter 270220209, -- @Nas_anikinShop 那須どうぶつ王国ネットショップ【 公式 】
      Twitter 267537691, -- @SaitamaCityPR さいたま市広報課
      Twitter 266449884, -- @aw_oarai アクアワールド茨城県大洗水族館
      Twitter 224057019, -- @izushabotenpark 伊豆シャボテン動物公園公式ツイッター
      Twitter 218385532, -- @shabotengroup 伊豆シャボテン動物公園グループ【公式】
      Twitter 217703937, -- @otaruaquarium おたる水族館
      Twitter 209849715, -- @KushimotoMP 和歌山・串本海中公園センター
      Twitter 205999791, -- @neopark754 ネオパークオキナワ
      Twitter 204238464, -- @kushirozoo 釧路市動物園
      Twitter 156534337, -- @Ibaraki_Kouhou 茨城県
      Twitter 154381364, -- @Osaka_Kaiyukan 大阪・海遊館
      Twitter 150990053, -- @utsunomiya_zoo 宇都宮動物園【公式】
      Twitter 148174653, -- @NASU_SAFARIPARK 那須サファリパーク
      Twitter 136808681, -- @Muse_Tokai 東海大学海洋科学博物館･自然史博物館
      Twitter 129197685, -- @nakprstaff 那須どうぶつ王国
      Twitter 128158330, -- @morikirara99 九十九島動植物園森きらら
      Twitter 126991605, -- @marinepia 新潟市水族館マリンピア日本海
      Twitter 109532430, -- @tobuzoo7 東武動物公園【公式】リュウくん
      Twitter 106002493, -- @suzaka_city 長野県須坂市
      Twitter 101746805, -- @chito_se_ame チトセアメ
      Twitter 99226401, -- @komorozoo 小諸市動物園【公式】
      Twitter 71168009, -- @aquatotto 世界淡水魚園水族館　アクア・トト ぎふ
      Twitter 68329219, -- @komorocity 長野県小諸市

      -- 非JAZA系
      Twitter 1217730379601207297, -- @sadocity_PR 佐渡市役所
      Twitter 1063585435853611009, -- @Nature_Okayama 岡山県自然保護センター
      Twitter 4514445018, -- @orbi_y オービィ横浜(みなとみらいで動物とふれあえるパーク)
      Twitter 3015826252, -- @sendaiuminomori 仙台うみの杜水族館公式
      Twitter 633733318, -- @mokusokai 花園教会水族館『国連・生物多様性アクション大賞』2年連続入賞/《外来いきもの図鑑》コラボ展示
      Twitter 479215305, -- @tokifanclub 佐渡トキファンクラブ
    ],
  },
  -- English
  Rule::{
    filter = Some Filter::{ title = basicFilter },
    exclude = Some Filter::{ title = basicExclude },
    outbox = [Outbox.Twitter pipitorIntl],
    topics = [
      -- Latest in Anime News by Crunchyroll!
      Feed "https://feeds.feedburner.com/crunchyroll/animenews",
      -- Latest Crunchyroll Videos
      Feed "https://feeds.feedburner.com/crunchyroll/rss",

      Twitter 4827947356, -- @SoundCadence Sound Cadence Studios
      Twitter 1505411478, -- @MabiOfficial Mabinogi
      Twitter 48619486, -- @discotekmedia 💿Discotek Media
      Twitter 28023330, -- @Crunchyroll Crunchyroll
      Twitter 17965667, -- @yenpress Yen Press
    ],
  },
  -- English-speking staff/casts
  Pipitor.Rule::{
    filter = Some Filter::{ title = individualFilter },
    outbox = [Outbox.Twitter pipitorIntl],
    topics = [
      Twitter 1156183891142742018, -- @WooWooSis Elisa Annette
      Twitter 1038986892384059392, -- @SuzieYeung Suzie Yeung
      Twitter 800890073059381248, -- @MaddieMorrisVA Madeleine Morris
      Twitter 758448733340114944, -- @mastagish Amanda R Gish
      Twitter 752226432982454272, -- @MichelleMarieVO Michelle Marie
      Twitter 3085905806, -- @Bryn_Apprill Bryn Apprill
      Twitter 3041268363, -- @anairis_q Anairis Quiñones ♥️✨
      Twitter 2817888392, -- @alisonviktorin Alison Viktorin
      Twitter 2699620357, -- @SkiniMini07 Dani Chambers
      Twitter 2695754530, -- @KBeeThatsMe Katelyn Barr @ Saint SEIYAAAAAAAAA
      Twitter 2462398062, -- @EmilyJFajardo Emily Fajardo
      Twitter 2322003031, -- @nvansistine Natalie Van Sistine
      Twitter 1976117580, -- @SarahWiedenheft Sarah Wiedenheft
      Twitter 1875923244, -- @YenniAnnVO Yenni Ann
      Twitter 1873469676, -- @MarissaLenti Marissa Lenti
      Twitter 1627409539, -- @WowSuchKrystal Krystal LaPorte
      Twitter 1616313728, -- @18moptop Megan Shipman
      Twitter 1436491782, -- @KayliMills Kayli Mills
      Twitter 1266342607, -- @TiaToony Tia Ballard
      Twitter 1172801040, -- @KrisComics Kristen McGuire 🦊💖
      Twitter 1069555015, -- @AlexisTiptonVA Alexis Tipton
      Twitter 1032040242, -- @kixee Kimberley @ KEMONO FRIENDS DUBBED!!
      Twitter 952667893, -- @SarahAnneWillia Sarah Anne Williams
      Twitter 871891459, -- @AmberFoxyVox Amber May (FoxyVox)
      Twitter 833771761, -- @HaybaleVoice Hayden Daviau 🍁
      Twitter 723134300, -- @AlexMooreActor Alex Moore is C-List, at Best
      Twitter 590253118, -- @ChrisGuerreroVA Christopher Guerrero
      Twitter 499999967, -- @caitlinsvoice Caitlin Glass
      Twitter 492719105, -- @DanielleMcVO Danielle McRae✊🏾
      Twitter 411836584, -- @AmberLeeConnors Amber Lee Connors
      Twitter 319168948, -- @TeeDotally 🅃🅴🅁🆁🄸 🅳🄾🆃🅈
      Twitter 284781826, -- @CeeCeeVA 🌸🌸Chasity Conner {COMMISSIONS OPEN}🌸🌸
      Twitter 237873897, -- @TheMorganBerry Morgan Berry
      Twitter 237053841, -- @FeleciaAngelle Felecia Angelle
      Twitter 113054268, -- @jadbsaxton Jad Saxton 😸
      Twitter 92737353, -- @Melizande Meli Grant
      Twitter 81049075, -- @Grandpa_Trout Kristi Rothrock 🎤
      Twitter 68042177, -- @LeeandLie AmaLee
      Twitter 65374366, -- @SandyDivaSane SandraToureVA
      Twitter 55322189, -- @Megami33 Corinne Sudberg
      Twitter 55069219, -- @KitsuneSqueak Emi Lo
      Twitter 47429528, -- @littleramyun Michelle Rojas
      Twitter 42297700, -- @soymilkpudding Ayu
      Twitter 40791597, -- @KiraBuckland Kira Buckland ★
      Twitter 29920373, -- @EliseBaughman Elise Baughman
      Twitter 18541233, -- @LSheppardVO Lindsay Sheppard
      Twitter 18176433, -- @mippa Melissa Sternenberg
      Twitter 17651468, -- @DawnMBennettVA Dawn M. Bennett
      Twitter 15974916, -- @LeahClarkVA Leah Clark ✌🏽✌🏾✌🏿
    ],
  },
]

in
Pipitor.Manifest::{
  twitter,
  rule,
}
