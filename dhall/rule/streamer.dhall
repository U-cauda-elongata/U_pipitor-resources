--| 配信者・VTuber
let Pipitor = ../Pipitor.dhall

let account = ../account.dhall

let filter = ../filter.dhall

let util = ../util.dhall

let rx = util.rx

let youtube = util.youtube

let Twitter = Pipitor.Topic.Twitter

in    [ Pipitor.Rule::{
        , filter = Some Pipitor.Filter::{
          , title = rx.any [ filter.basic, filter.kemovAnimalNameHashtags ]
          }
        , outbox = [ Pipitor.Outbox.Twitter account.vpPipitor ]
        , topics = [
            youtube "UCzuEc7Nsm9GtMX4yuzjSqgA", -- 超人女子戦士 ガリベンガーV
            youtube "UCz6Gi81kE6p5cdW1rT0ixqw", -- もこめめ*channel
            youtube "UCyb-cllCkMREr9de-hoiDrg", -- ヤマト イオリ
            youtube "UCyKsg-57XC9pyHbP7v3kCPQ", -- Miori Ch. ミオリ・セレスタ 【Tsunderia】
            youtube "UCyDlCb8B48ZrSJvknOQsRog", -- 酵穣 桃桜Momozakura Kojo
            youtube "UCxJ9SJLG7dA00M7VoEe4ltw", -- 天川はの/AmakawaHano
            youtube "UCwUNuXd6rN08SQFzlIH4Ozg", -- なつめえりちゃんねる / Natsume Eri ch.
            youtube "UCw1KNjVqfrJSfcFd6zlcSzA", -- Nia Suzune / 鈴音にあ [PRISM Project]
            youtube "UCtM5G3bS7zM8bv6p-OwoNTw", -- リクム
            youtube "UCtKH7ZHAJ7TcTjyiLJRHhvg", -- 彩雲のの - Nono Ayamo -
            youtube "UCswvd6_YWmd6riRk-8oT-sA", -- Shiki Miyoshino / 美吉野しき [PRISM Project]
            youtube "UCs-lYkwb-NYKE9_ssTRDK3Q", -- ねくろちゃん -Yamaguro Nekuro- /あおぎり高校
            youtube "UCrFM9PePa4a7654qY9psGjA", -- 肆ノ島來世 / Shinoshima Raise
            youtube "UCqd9gfQFKjbrkfyr0-enzNw", -- Kohaku Ch.羽奏 こはく
            youtube "UCqTGCMjeKOclEEfW8Vs7sXQ", -- ガッチマンV
            youtube "UCpeRj9-GaLGNUoKdI5I7vZA", -- Pina Pengin / 辺銀ピナ [PRISM Project]
            youtube "UCoFEbNyIRUS26-hf2AucwFw", -- Nekono Yukino / 猫乃ユキノ
            youtube "UCn14Z641OthNps7vppBvZFA", -- 千草はな / Chigusa Hana
            youtube "UCmxAWbOvT8osBX_tGMVFVPA", -- ヒラ
            youtube "UCmB1E78Kdgd9z6hN3ONRKow", -- 花ノ木まる ✿ Hananoki Maru
            youtube "UCkPIfBOLoO0hVPG-tI2YeGg", -- Tomari Mari channel / 兎鞠まりちゃんねる
            youtube "UCju7v8SkoWUQ5ITCQwmYpYg", -- メリーミルクの森
            youtube "UCjlmCrq4TP1I4xguOtJ-31w", -- でびでび・でびる
            youtube "UCiLt4FLjMXszLOh5ISi1oqw", -- Kakeru Ch. 間取かける
            youtube "UCgBWNQXfLb28FdK8s0FxO7Q", -- 七宮 ソウ / Sou Nanamiya
            youtube "UCfol9ZU2HpEajyBDj-EbiOQ", -- 雲母ミミl KiraraMimi
            youtube "UCfiK42sBHraMBK6eNWtsy7A", -- Mari Channelかしこまり
            youtube "UCfeznQrLe9URem6xJmWQVlw", -- Mama Ch. 倉持京子
            youtube "UCevD0wKzJFpfIkvHOiQsfLQ", -- ひなたチャンネル (Hinata Channel)
            youtube "UCeqIMtLuGc3YgwkhEaG8oDg", -- 稀羽すう - Suu Usuwa -
            youtube "UCdn5BQ06XqgXoAxIhbqw5Rg", -- フブキCh。白上フブキ
            youtube "UCdMpGhtL9oK8EYolTt8v4uQ", -- VOMS Project
            youtube "UCajhBT4nMrg3DLS-bLL2RCg", -- 天野ピカミィ. Pikamee
            youtube "UCa5g-Q_NT2COXiSS55bwXVQ", -- Kazami Mikan - 風海みかんちゃんねる - official
            youtube "UC_vFNa_irvWQapwwaasYMOQ", -- Life Like a Live!（えるすりー）
            youtube "UC_kJ27jGTWYniW-Xy3Ms5Cw", -- Hikari CH.ネ申乃ひかり
            youtube "UC_WOBIopwUih0rytRnr_1Ag", -- Rui Channel / 瀬島るい 【あにまーれ】
            youtube "UCZszUCQMhWNVMxp6CSoyWoA", -- 人生 つみこJinsei Tsumiko
            youtube "UCZQ7nZ8Lc7pslBN0gN1Jg0w", -- Bao The Whale
            youtube "UCYKX4HL54erXdCyMj7TpFyg", -- Shizukou
            youtube "UCXp7sNC0F_qkjickvlYkg-Q", -- Kuku Channel / 風見くく 【あにまーれ】
            youtube "UCXXnWssOLdB2jg-4CznteAA", -- こまるCh. - Komaru Kurikoma -/あおぎり高校
            youtube "UCX7YkU9nEeaoZbkVLVajcMg", -- にじさんじ
            youtube "UCWq6L3iY4hGK4LmylvQtj-g", -- 桜樹みりあ
            youtube "UCWcEgYIOqq1BVr4Qm1sPuVg", -- あまり驚かないガッチマンはホラーゲームばかりやっている
            youtube "UCVbRXkQP-LumaBzfw-wsrrg", -- 皇ロゼ／SumeragiRose ch
            youtube "UCVXGiGSzuMJr-FdKZq3mOzg", -- 上乗 恋/REN CHANNEL
            youtube "UCUyBb-nTJoFWUOydbExmLuQ", -- Shizukou VODs
            youtube "UCUZ5AlC3rTlM-rA2cj5RP6w", -- 神楽すず
            youtube "UCTEZGNJDqv-isWSPRsEhnRA", -- Marumochi Tsukimi / 丸餅つきみ
            youtube "UCSlcMof1GIPvH6H_VcknCbQ", -- 七星みりり
            youtube "UCRXBTd80F5IIWWY4HatJ5Ug", -- 花園セレナ
            youtube "UCR6f6Cx-dWX0nbteSXvhI6g", -- アナウンサーたぐちのガチ実況チャンネル
            youtube "UCQ7CahbXDmC0ibAULBxRJBQ", -- 屋敷シエルYashiki Ciel
            youtube "UCQ0UDLQCjY0rmuxCDE38FGg", -- Matsuri Channel 夏色まつり - YouTube
            youtube "UCP9ZgeIJ3Ri9En69R0kJc9Q", -- Chieri  Kakyoin
            youtube "UCO_o0X1-ESEk8LEr1g9x1wg", -- 猫羽ころんNekohakoron
            youtube "UCODNLyn3L83wEmC0DLL0cxA", -- 朝ノ姉妹ぷろじぇくと
            youtube "UCMzxQ58QL4NNbWghGymtHvw", -- カルロ・ピノ
            youtube "UCLhUvJ_wO9hOvv_yYENu4fQ", -- Siro Channel
            youtube "UCKvij44VV9TWt-EM3evoRWg", -- Yuzu Ch. ENVtuber 蛾虫ユズ
            youtube "UCJePO0Zl-zZTqjpHO82RNNA", -- ミツルギリア Lia Mitsurugi【WACTOR】
            youtube "UCJQMHCFjVZOVRYafR6gY04Q", -- Usami Yuno Ch. 宇佐美 ユノ
            youtube "UCJFZiqLMntJufDCHc6bQixg", -- hololive ホロライブ - VTuber Group
            youtube "UCJCzy0Fyrm0UhIrGQ7tHpjg", -- 愛宮みるくMilk Enomiya
            youtube "UCIoRFfQdwgErIokdU4Zb-Sg", -- Kaheru Ch. カヘルチャンネル
            youtube "UCH6jR8Ddrevo4OFddNr5ACg", -- rucaco ch. / るかこちゃんねる
            youtube "UCFrH3bfn7gDeV29wrHHM80g", -- 射貫まといちゃんねる
            youtube "UCE5VgVGRPfNCjXPeTe1QJHA", -- 羽渦ミウネル -Miuneru Haneuzu-
            youtube "UCDzdRLILLWlHxXnj3HhXW0A", -- Caitlin Myers
            youtube "UCDrG8pzkq_cCCLcN5wgrzNw", -- 魔光リサ - Lisa Makoh -
            youtube "UCCe6J3ls9PMpcKEEmJ0F8KA", -- アメザリひらい Virtual
            youtube "UCCXD2-TV-X_gNkD2qEKyQWw", -- 【個人】マキオ
            youtube "UCB1s_IdO-r0nUkY2mXeti-A", -- 獅子神レオナ/レオナちゃんねる
            youtube "UCAr7rLi_Wn09G-XfTA07d4g", -- 天神 子兎音 Tenjin Kotone
            youtube "UCAZ_LA7f0sjuZ1Ni8L2uITw", -- どっとライブ
            youtube "UCAHXqn4nAd2j3LRu1Qyi_JA", -- エトラ / étraチャンネル
            youtube "UC90vyzmRgWCE17-uWNsKW2Q", -- 【Re:AcT /リアクト】公式チャンネル
            youtube "UC8jskpQfW9fn2NLK3PdaGdg", -- 夢川かなう/Kanau ch
            youtube "UC8NZiqKx6fsDT3AVcMiVFyA", -- Tamaki Ch. 犬山たまき / 佃煮のりお
            youtube "UC7yqc24BjJwi3PoqhXrx6og", -- たみーCh / 民安ともえ
            youtube "UC7gPyay3txm7gfBdrCIqObA", -- 香ヶ辻 そより┊Soyori Kagatsuji
            youtube "UC6TyfKcsrPwBsBnx2QobVLQ", -- 【世界初?!】男性バーチャルYouTuber ばあちゃる
            youtube "UC6TfqY40Xt1Y0J-N18c85qQ", -- 安土桃
            youtube "UC6HjtF2rHZO8gAsX5FXF-Kg", -- 姫熊 りぼん-Himekuma Ribon-
            youtube "UC5XQhzMH08PgWa4Zp02Gcsw", -- 月紫アリアch / Tsukushi Aria
            youtube "UC4PrHgUcAtOoj_LKmUL-uLQ", -- Mia Channel / 湖南みあ 【あにまーれ】
            youtube "UC4OeUf_KfYRrwksschtRYow", -- 花鋏キョウ/キョウちゃんねる
            youtube "UC3xG1XWzAKt5dxSxktJvtxg", -- Rukako Channel / 大浦るかこ 【あにまーれ】
            youtube "UC3vzVK_N_SUVKqbX69L_X4g", -- 緋笠トモシカ - Tomoshika Hikasa -
            youtube "UC3Ruo_5doyu514PesWGvCAg", -- Aoi ch.
            youtube "UC3KldSym-HTLMkvitStsNTw", -- 天満ニア-AmamaNia-
            youtube "UC2rIXE0D3Vb8kS48DQrW-Jg", -- Kokuri Ch.来音こくり
            youtube "UC2hWFlqMew61Jy6A8zu5HzQ", -- Iku Hoshifuri / 星降いく [PRISM Project]
            youtube "UC1suqwovbL1kzsoaZgFZLKg", -- Choco Ch. 癒月ちょこ
            youtube "UC0Owc36U9lOyi9Gx9Ic-4qg", -- Haneru Channel / 因幡はねる 【あにまーれ】
            youtube "UC-VWUn_oDeokHEkuTmVrLHg", -- Kuon ch.桜神くおん
            youtube "UC--A2dwZW7-M2kID0N6_lfA", -- Chris Channel / 獅子王クリス 【シュガリリ】
            Twitter 1456978868435550208, -- @SoyoriKagatsuji 香ヶ辻そより
            Twitter 1456976135116705792, -- @hananoki_maru 花ノ木まる
            Twitter 1436344036026060801, -- @Miuneru_ 羽渦ミウネル🍥
            Twitter 1424274561189564418, -- @kurikoma_komaru 栗駒こまる@あおぎり高校新人vtuber/1月10日-22:30 開封
            Twitter 1419329503512301573, -- @r_snsm 肆ノ島 來世 / Shinoshima Raise
            Twitter 1401301000477085698, -- @PinaPengin Pina Pengin | 辺銀ピナ🐧❄️ 3rd GEN - PRISM Project
            Twitter 1401266522589380611, -- @niasuzune Nia Suzune / 鈴音にあ
            Twitter 1401221154384326665, -- @shikimiyoshino Shiki Miyoshino / 美吉野しき
            Twitter 1393208011519262725, -- @VOMS_Project VOMS Project
            Twitter 1386369134649249794, -- @kohaku_wakana 羽奏 こはく🥟🐉@いせぶい
            Twitter 1376360554692939782, -- @yamaguro_nekuro 山黒音玄@あおぎり高校 Vtuber High School
            Twitter 1375632508776194048, -- @momozakurakojo 酵穣桃桜コラボ酒完売ありがとうございます
            Twitter 1370394103612051462, -- @Yashiki_Ciel 屋敷シエルぶいせん
            Twitter 1370242764323975170, -- @tsukushi_aria 月紫アリア🦇☪️
            Twitter 1359166213352546318, -- @isev_info いせぶい【公式】
            Twitter 1353969622907670528, -- @SanagiYuzu Yuzu 🦋
            Twitter 1351423100026425344, -- @Mia_Konan 湖南みああにまーれ
            Twitter 1351387644081520641, -- @Rukako_Oura 大浦るかこ🦉あにまーれ
            Twitter 1346828641989103617, -- @IkuHoshifuri  Iku Hoshifuri 👽💖 @ PRISM Project
            Twitter 1342364242737938434, -- @Milily_VTuber 七星みりり💥💫Vtuber❤️
            Twitter 1325958691774853120, -- @kaminohikarin 神乃ひかり目指せ！チャンネル登録2万人
            Twitter 1325622604389117954, -- @mioricelesta Miori 📜 Tsunderia
            Twitter 1314511790756167681, -- @kokuri_kurune 来音 こくり🦊🌰ASMR修行中💕
            Twitter 1308626156447436801, -- @Rui_Seshima 瀬島るい📮🦴あにまーれ
            Twitter 1302600596621373440, -- @PRISMProj PRISM Project
            Twitter 1300476189702717440, -- @@nekoha_koron 猫羽ころん🐱🤍Vtuber/毎日配信 21時30分〜
            Twitter 1297779643521482752, -- @kuramochikyoko 倉持京子ASMR勉強中
            Twitter 1293164758036692992, -- @Ookami__Kuon 桜神 くおん🐾🌸ぴくぷり
            Twitter 1274659198907740161, -- @LifeLikeaLive Life Like a Live!2公式(#えるすりー)＠2021年9/18～9/20開催決定！
            Twitter 1274000870867439616, -- @Shizukougames Shizukou  VTuber
            Twitter 1265091241609322496, -- @noriopro のりプロ公式🌞
            Twitter 1253633049884942337, -- @tukimi_marumoti 丸餅つきみ🍡ゴシップ歌いました
            Twitter 1240652791892172800, -- @ChrisShishio 獅子王クリス🎄🐙シュガリリ
            Twitter 1234698396297859072, -- @SugarLyric_PI シュガーリリック公式🍩三毛猫ななし
            Twitter 1227374082468937728, -- @matorikakeru 間取かける🪟❌Matori Kakeru Vtuber
            Twitter 1226794187711901702, -- @Tomoshika_H 緋笠トモシカ
            Twitter 1225702850002468864, -- @amanopikamee ピカミィ⚡️Pikamee
            Twitter 1224952244719587328, -- @Kuku_Kazami 風見くくあにまーれ
            Twitter 1224653916131823616, -- @Kirara_Mimi 雲母ミミKiraraMimi抱き枕予約販売中25万人ありがとお
            Twitter 1223260492245811200, -- @amamania_vtuber 天満ニア🦊💮20時もふもふ船🚀
            Twitter 1204726426328395776, -- @MitsurugiLia ミツルギリア⬡4/29 VtuberFes2022
            Twitter 1173826248813858817, -- @sb_ribon_ 姫熊りぼん VTuber21:00動画
            Twitter 1168042569416077312, -- @etra_ASI エトラ/ étra
            Twitter 1120021521752154112, -- @Enomiya_MILK 愛宮みるく
            Twitter 1099929347283050496, -- @makio_elecom マキオ@S11 マスター
            Twitter 1087300458983481346, -- @sou_nanamiya12 七宮ソウ  Sou Nanamiya
            Twitter 1082980672174583809, -- @garibenV ガリベンガーＶ【公式】TVer&ABEMA&GYAO&テレ朝動画で無料見逃し配信
            Twitter 1065021083810705409, -- @mom0ki Momoki 🕯️ VTube
            Twitter 1032800529846435841, -- @Kamijo_Ren 🎰上乗 恋＠777パチガブ専属パチンコ/パチスロバーチャルライター🎰
            Twitter 1030728825808666624, -- @Kanau_Yumekawa 夢川かなう🐟
            Twitter 1030309605090316288, -- @LeonaShishigami 獅子神レオナ
            Twitter 1029373963938324480, -- @hanazono_serena 🍯花園セレナ/HanazonoSerena🍯
            Twitter 1024970912859189248, -- @yuzukichococh 癒月ちょこ💋@ChocoLoveMV公開しました！
            Twitter 1011877417290362881, -- @tomari_mari 兎鞠まり
            Twitter 1009981179884285952, -- @hanachigusa_ch 千草 はな🦊🌼 オリジナルパーカー予約受付中
            Twitter 1002075894880452609, -- @momo_azuchi_ 安土桃🍑
            Twitter 997786053124616192, -- @shirakamifubuki 白上フブキ@暁月なう🦊🌽
            Twitter 996645451045617664, -- @natsuiromatsuri 夏色まつりNatsuiroMatsuri
            Twitter 995983309715865600, -- @kaheru_orange kaheru🍊カヘル
            Twitter 995247053977485313, -- @Haneru_Inaba 因幡はねる有閑喫茶あにまーれ
            Twitter 993839162099810305, -- @AniMare_cafe あにまーれ公式黒猫ななし
            Twitter 992044186252685312, -- @YamatoIori ヤマト イオリ
            Twitter 992039541547585536, -- @carro_pino カルロ ピノ
            Twitter 992036953804558336, -- @kagura_suzu 神楽すず1日12時　年明け雑談
            Twitter 991562536632778752, -- @asanoruri 朝ノ瑠璃✪忍者系声優VTuber
            Twitter 989781496780083200, -- @Re_AcT_ Re:AcT / リアクト【公式】
            Twitter 986871577890312192, -- @kotonegami 天神子兎音 / Kotone
            Twitter 972988058659270656, -- @tsumiko_channel 人生つみこ😱🫀ﾎﾗｰｹﾞｰﾑ専門Vtuber
            Twitter 972262397640548352, -- @chieri_kakyoin 花京院ちえり
            Twitter 971926028842033152, -- @mokomeme_ch もこ田めめめ
            Twitter 963358908986269696, -- @kashikomari_ch かしこまりRe:AcTに所属しました
            Twitter 962112920917127168, -- @Nekomiya_Hinata 猫宮ひなた(Nekomiya Hinata)
            Twitter 953079145335988224, -- @dotLIVEyoutuber .LIVE【どっとライブ】
            Twitter 944104131383271424, -- @Miria_Sakuragi_ 桜樹みりあ＠踊投稿しました
            Twitter 923118677452402690, -- @fuji_aoi_0618 富士葵
            Twitter 916156645004029952, -- @hololivetv ホロライブプロダクション【公式】
            Twitter 877820534712451072, -- @SIROyoutuber 電脳少女シロ
            Twitter 4919358698, -- @tv_asahi_douga 【公式】テレ朝動画
            Twitter 3271690045, -- @shohei_taguchi たぐちアナ
            Twitter 3068808974, -- @baovtuber Bao 🐳 Whaletuber
            Twitter 2270560254, -- @_rucaco_ rucaco/るかこ〰🍎
            Twitter 320959459, -- @justfream FREAM ✦ VTUBER
            Twitter 218450187, -- @norioo_ 佃煮のりお/犬山たまき🐶💙
            Twitter 200080344, -- @tanista_com タニさん＠タニスタ
            Twitter 183640212, -- @hira_saiore ヒラ
            Twitter 113083374, -- @erisize なつめえり🍚
            Twitter 110879535, -- @Gatchman666 ガッチマン （総合）
            Twitter 87467070, -- @tammy_now 民安ともえ(Vtuberたみー)オーディション2次審査応援感謝！結果は12/18ニコ生で！
            Twitter 73860359, -- @amezari_hirai アメザリひらい🦞えにしん
          ]
        }
      , Pipitor.Rule::{
        , -- しゅりむす関連ハッシュタグの接頭辞。
          -- 無関係のタグとの衝突を避けるため保守的にフィルターする。
          filter = Some Pipitor.Filter::{
          , title =
              rx.any
                [ filter.basic
                , filter.kemovAnimalNameHashtags
                , rx.hash (rx.any [ "こんがお", "こんのん" ])
                ]
          }
        , outbox = [ Pipitor.Outbox.Twitter account.vpPipitor ]
        , topics = [
            youtube "UCsAzaxwiKWolOWLH1bIU3wA", -- 彩 まよい【ミリタリーVTuber】 - YouTube
            youtube "UCpPuEfqwYbpn7e2jWdQeWew", -- 水瓶ミア/ミアちゃんねる
            youtube "UCcd4MSYH7bPIBEUqmBgSZQw", -- ルルン・ルルリカ
            youtube "UCaq_BEsIHLVvdU6lCKLtipQ", -- Hanakoto Igusa (jp) - YouTube
            youtube "UC3-jXrZXv-PQshpaTQpicPQ", -- のんちゃんねる【桜月花音】 - YouTube
            Twitter 1342363212809793538, -- @Rururica_VTuber ルルン•ルルリカ
            Twitter 1034280896575102977, -- @Mia_Mizugame 水瓶ミア
            Twitter 1009977580936577024, -- @SakurazukiKanon 桜月花音コラボイヤフォン＆ワイヤレス充電器販売中
            Twitter 1001386513949646848, -- @irodorimayoi 彩まよい ミリタリーVTuber
            Twitter 953420062794309632, -- @hanakoto82 花琴いぐさ妖怪Vtuberです
          ]
        }
      , Pipitor.Rule::{
        , -- この呼称を用いるのは執筆時時点で鬼ヶ島ぴぃちさんのみなので保守的にフィルターする。
          filter = Some Pipitor.Filter::{
          , title = rx.any [ filter.basic, filter.kemovAnimalNameHashtags, "イロちゃんまん" ]
          }
        , outbox = [ Pipitor.Outbox.Twitter account.vpPipitor ]
        , topics = [
            youtube "UCcq3DnobBkRca4p8pntDntg", -- 鬼ヶ島ぴぃち
            Twitter 1375790515916996614, -- @piiiti_v 鬼ヶ島ぴぃち
          ]
        }
      ]
    # ( let topics =
            -- 文脈によって `@KF_pipitor` でリツイートするべきアカウント（けもフレ３コラボ）。
              [
                Twitter 1034137905000636417, -- @debidebiru_sama でびでび・でびる
                Twitter 950967576980422657, -- @nijisanji_app にじさんじ公式🌈🕒
              ]

        let kemovFilter = rx.any [ filter.kemov, filter.kemovAnimalNameHashtags ]

        in  [ Pipitor.Rule::{
              , filter = Some Pipitor.Filter::{ title = kemovFilter }
              , outbox = [ Pipitor.Outbox.Twitter account.vpPipitor ]
              , topics
              }
            , Pipitor.Rule::{
              , filter = Some Pipitor.Filter::{ title = filter.basic }
              , exclude = Some Pipitor.Filter::{ title = kemovFilter }
              , outbox = [ Pipitor.Outbox.Twitter account.pipitor ]
              , topics
              }
            ]
      )
