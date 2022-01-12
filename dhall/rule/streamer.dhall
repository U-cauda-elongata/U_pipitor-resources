--| 配信者・VTuber
let Pipitor = ../Pipitor.dhall

let account = ../account.dhall

let filter = ../filter.dhall

let util = ../util.dhall

let rx = util.rx

let youtube = util.youtube

let Twitter = Pipitor.Topic.Twitter

in  [ Pipitor.Rule::{
      , filter = Some Pipitor.Filter::{
        , title = rx.any [ filter.basic, filter.kemovHashtags ]
        }
      , outbox = [ Pipitor.Outbox.Twitter account.pipitor ]
      , topics = [
          youtube "UCzuEc7Nsm9GtMX4yuzjSqgA", -- 超人女子戦士 ガリベンガーV
          youtube "UCz6Gi81kE6p5cdW1rT0ixqw", -- もこめめ*channel
          youtube "UCyb-cllCkMREr9de-hoiDrg", -- ヤマト イオリ
          youtube "UCyDlCb8B48ZrSJvknOQsRog", -- 酵穣 桃桜Momozakura Kojo
          youtube "UCsAzaxwiKWolOWLH1bIU3wA", -- 彩 まよい【ミリタリーVTuber】 - YouTube
          youtube "UCs-lYkwb-NYKE9_ssTRDK3Q", -- ねくろちゃん -Yamaguro Nekuro- /あおぎり高校
          youtube "UCpPuEfqwYbpn7e2jWdQeWew", -- 水瓶ミア/ミアちゃんねる
          youtube "UCmxAWbOvT8osBX_tGMVFVPA", -- ヒラ
          youtube "UCmB1E78Kdgd9z6hN3ONRKow", -- 花ノ木まる ✿ Hananoki Maru
          youtube "UCkPIfBOLoO0hVPG-tI2YeGg", -- Tomari Mari channel / 兎鞠まりちゃんねる
          youtube "UCfol9ZU2HpEajyBDj-EbiOQ", -- 雲母ミミl KiraraMimi
          youtube "UCgBWNQXfLb28FdK8s0FxO7Q", -- 七宮 ソウ / Sou Nanamiya
          youtube "UCfeznQrLe9URem6xJmWQVlw", -- Mama Ch. 倉持京子
          youtube "UCevD0wKzJFpfIkvHOiQsfLQ", -- ひなたチャンネル (Hinata Channel)
          youtube "UCcq3DnobBkRca4p8pntDntg", -- 鬼ヶ島ぴぃち
          youtube "UCcd4MSYH7bPIBEUqmBgSZQw", -- ルルン・ルルリカ
          youtube "UC_vFNa_irvWQapwwaasYMOQ", -- Life Like a Live!（えるすりー）
          youtube "UC_kJ27jGTWYniW-Xy3Ms5Cw", -- Hikari CH.ネ申乃ひかり
          youtube "UCXp7sNC0F_qkjickvlYkg-Q", -- Kuku Channel / 風見くく 【あにまーれ】
          youtube "UCXXnWssOLdB2jg-4CznteAA", -- こまるCh. - Komaru Kurikoma -/あおぎり高校
          youtube "UCWq6L3iY4hGK4LmylvQtj-g", -- 桜樹みりあ
          youtube "UCWcEgYIOqq1BVr4Qm1sPuVg", -- あまり驚かないガッチマンはホラーゲームばかりやっている
          youtube "UCUZ5AlC3rTlM-rA2cj5RP6w", -- 神楽すず
          youtube "UCP9ZgeIJ3Ri9En69R0kJc9Q", -- Chieri  Kakyoin
          youtube "UCODNLyn3L83wEmC0DLL0cxA", -- 朝ノ姉妹ぷろじぇくと
          youtube "UCQ0UDLQCjY0rmuxCDE38FGg", -- Matsuri Channel 夏色まつり - YouTube
          youtube "UCMzxQ58QL4NNbWghGymtHvw", -- カルロ・ピノ
          youtube "UCaq_BEsIHLVvdU6lCKLtipQ", -- Hanakoto Igusa (jp) - YouTube
          youtube "UCR6f6Cx-dWX0nbteSXvhI6g", -- アナウンサーたぐちのガチ実況チャンネル
          youtube "UCQ7CahbXDmC0ibAULBxRJBQ", -- 屋敷シエルYashiki Ciel
          youtube "UCLhUvJ_wO9hOvv_yYENu4fQ", -- Siro Channel
          youtube "UCJFZiqLMntJufDCHc6bQixg", -- hololive ホロライブ - VTuber Group
          youtube "UCCXD2-TV-X_gNkD2qEKyQWw", -- 【個人】マキオ
          youtube "UCB1s_IdO-r0nUkY2mXeti-A", -- 獅子神レオナ/レオナちゃんねる
          youtube "UCAr7rLi_Wn09G-XfTA07d4g", -- 天神 子兎音 Tenjin Kotone
          youtube "UC7yqc24BjJwi3PoqhXrx6og", -- たみーCh / 民安ともえ
          youtube "UC7gPyay3txm7gfBdrCIqObA", -- 香ヶ辻 そより┊Soyori Kagatsuji
          youtube "UC6HjtF2rHZO8gAsX5FXF-Kg", -- 姫熊 りぼん-Himekuma Ribon-
          youtube "UC4PrHgUcAtOoj_LKmUL-uLQ", -- Mia Channel / 湖南みあ 【あにまーれ】
          youtube "UC3vzVK_N_SUVKqbX69L_X4g", -- 緋笠トモシカ - Tomoshika Hikasa -
          youtube "UC3-jXrZXv-PQshpaTQpicPQ", -- のんちゃんねる【桜月花音】 - YouTube
          youtube "UC0Owc36U9lOyi9Gx9Ic-4qg", -- Haneru Channel / 因幡はねる 【あにまーれ】
          Twitter 1456978868435550208, -- @SoyoriKagatsuji 香ヶ辻そより
          Twitter 1456976135116705792, -- @hananoki_maru 花ノ木まる
          Twitter 1424274561189564418, -- @kurikoma_komaru 栗駒こまる@あおぎり高校新人vtuber/1月10日-22:30 開封
          Twitter 1376360554692939782, -- @yamaguro_nekuro 山黒音玄@あおぎり高校 Vtuber High School
          Twitter 1375790515916996614, -- @piiiti_v 鬼ヶ島ぴぃち
          Twitter 1375632508776194048, -- @momozakurakojo 酵穣桃桜コラボ酒完売ありがとうございます
          Twitter 1370394103612051462, -- @Yashiki_Ciel 屋敷シエルぶいせん
          Twitter 1351423100026425344, -- @Mia_Konan 湖南みああにまーれ
          Twitter 1342363212809793538, -- @Rururica_VTuber ルルン•ルルリカ
          Twitter 1325958691774853120, -- @kaminohikarin 神乃ひかり目指せ！チャンネル登録2万人
          Twitter 1297779643521482752, -- @kuramochikyoko 倉持京子ASMR勉強中
          Twitter 1274659198907740161, -- @LifeLikeaLive Life Like a Live!2公式(#えるすりー)＠2021年9/18～9/20開催決定！
          Twitter 1226794187711901702, -- @Tomoshika_H 緋笠トモシカ
          Twitter 1224952244719587328, -- @Kuku_Kazami 風見くくあにまーれ
          Twitter 1224653916131823616, -- @Kirara_Mimi 雲母ミミKiraraMimi抱き枕予約販売中25万人ありがとお
          Twitter 1173826248813858817, -- @sb_ribon_ 姫熊りぼん VTuber21:00動画
          Twitter 1099929347283050496, -- @makio_elecom マキオ@S11 マスター
          Twitter 1087300458983481346, -- @sou_nanamiya12 七宮ソウ  Sou Nanamiya
          Twitter 1082980672174583809, -- @garibenV ガリベンガーＶ【公式】TVer&ABEMA&GYAO&テレ朝動画で無料見逃し配信
          Twitter 1034280896575102977, -- @Mia_Mizugame 水瓶ミア
          Twitter 1030309605090316288, -- @LeonaShishigami 獅子神レオナ
          Twitter 1011877417290362881, -- @tomari_mari 兎鞠まり
          Twitter 1009977580936577024, -- @SakurazukiKanon 桜月花音コラボイヤフォン＆ワイヤレス充電器販売中
          Twitter 1001386513949646848, -- @irodorimayoi 彩まよい ミリタリーVTuber
          Twitter 996645451045617664, -- @natsuiromatsuri 夏色まつりNatsuiroMatsuri
          Twitter 995247053977485313, -- @Haneru_Inaba 因幡はねる有閑喫茶あにまーれ
          Twitter 993839162099810305, -- @AniMare_cafe あにまーれ公式黒猫ななし
          Twitter 992044186252685312, -- @YamatoIori ヤマト イオリ
          Twitter 992039541547585536, -- @carro_pino カルロ ピノ
          Twitter 992036953804558336, -- @kagura_suzu 神楽すず1日12時　年明け雑談
          Twitter 991562536632778752, -- @asanoruri 朝ノ瑠璃✪忍者系声優VTuber
          Twitter 986871577890312192, -- @kotonegami 天神子兎音 / Kotone
          Twitter 972262397640548352, -- @chieri_kakyoin 花京院ちえり
          Twitter 971926028842033152, -- @mokomeme_ch もこ田めめめ
          Twitter 962112920917127168, -- @Nekomiya_Hinata 猫宮ひなた(Nekomiya Hinata)
          Twitter 953420062794309632, -- @hanakoto82 花琴いぐさ妖怪Vtuberです
          Twitter 953079145335988224, -- @dotLIVEyoutuber .LIVE【どっとライブ】
          Twitter 944104131383271424, -- @Miria_Sakuragi_ 桜樹みりあ＠踊投稿しました
          Twitter 916156645004029952, -- @hololivetv ホロライブプロダクション【公式】
          Twitter 877820534712451072, -- @SIROyoutuber 電脳少女シロ
          Twitter 4919358698, -- @tv_asahi_douga 【公式】テレ朝動画
          Twitter 3271690045, -- @shohei_taguchi たぐちアナ
          Twitter 200080344, -- @tanista_com タニさん＠タニスタ
          Twitter 183640212, -- @hira_saiore ヒラ
          Twitter 110879535, -- @Gatchman666 ガッチマン （総合）
          Twitter 87467070, -- @tammy_now 民安ともえ(Vtuberたみー)オーディション2次審査応援感謝！結果は12/18ニコ生で！
        ]
      }
    ]
