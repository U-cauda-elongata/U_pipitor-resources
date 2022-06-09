--| 個人アカウント（スタッフ・キャスト等）
let Pipitor = ../Pipitor.dhall

let account = ../account.dhall

let filter = ../filter.dhall

let util = ../util.dhall

let rx = util.rx

let Twitter = Pipitor.Topic.Twitter

in    [ Pipitor.Rule::{
        , -- 日本語
          filter = Some Pipitor.Filter::{ title = filter.individual.common }
        , outbox = [ Pipitor.Outbox.Twitter account.pipitorIndv ]
        , topics = [
            Twitter 1522057394917810176, -- @msk_akane 美坂朱音
            Twitter 1483360649967468546, -- @aino_shimada 島田愛野
            Twitter 1446494020474048513, -- @Carry_Kiyama Carry Kiyama
            Twitter 1374558576560074755, -- @azusa_shizuki 紫月杏朱彩
            Twitter 1363811039003906051, -- @ii_myp 吉咲みゆ
            Twitter 1363795372867428354, -- @WakanaMaruoka 丸岡和佳奈
            Twitter 1314640424062001152, -- @ssk_ktk828 佐々木琴子 公式
            Twitter 1303545074303660033, -- @meg_umezawa 梅澤 めぐ
            Twitter 1270344324203474944, -- @riko_shinozuka 篠塚 理子
            Twitter 1258795531846864898, -- @eriko_kadokura 角倉英里子
            Twitter 1246330706030034944, -- @hiro_se_ika 広瀬世華
            Twitter 1245016521144819717, -- @ayaka_hirose 広瀬彩海
            Twitter 1243186032025063424, -- @shirasawayuri 白沢由梨
            Twitter 1210889093124505600, -- @_Amane_Kanon_ 天希かのん
            Twitter 1184389242761310208, -- @youmiya_hina 羊宮妃那
            Twitter 1153920859578331136, -- @izm_tako 和泉風花
            Twitter 1147811213989928961, -- @Otsuki__Rena おおつき れな
            Twitter 1141319903250534400, -- @kitoakari_1016 鬼頭明里
            Twitter 1134589498610802688, -- @eino_airi_staff 永野愛理 スタッフ【公式】
            Twitter 1129194500365070336, -- @NINMiO_APT 二宮みお
            Twitter 1126735473102090240, -- @YUI_STAFF 石川由依Official
            Twitter 1125555085067505664, -- @Anna_Mihayashi 御林杏夏
            Twitter 1123177804114190336, -- @kaayaataaaan 奥野香耶
            Twitter 1209786763725529089, -- @Imaizumiriona 今泉りおな
            Twitter 1120670106617384960, -- @shiraki_riho 白木莉帆（タートルリリー）
            Twitter 1119802045798567936, -- @o_piyo_o 上杉 夏穂
            Twitter 1118785839130009600, -- @romipark_fc 朴璐美 Official Staff
            Twitter 1117014055275753472, -- @NeikoInoue 井上 寧子(いのうえ ねいこ)
            Twitter 1113758206436622336, -- @yoshioka_mayuC 吉岡茉祐
            Twitter 1113445785004269568, -- @minazou_373 田中美海
            Twitter 1110744793133416449, -- @kirara_ouo 南山希来々
            Twitter 1109020541904535552, -- @SHIMPOREI 新保レイ
            Twitter 1082826501609799680, -- @misawa_official 三澤 紗千香(みさわ さちか)official
            Twitter 1079251759179026432, -- @sayaka_harada_ 原田 彩楓
            Twitter 1068802762215841792, -- @hitomi_s_1030 咲々木瞳
            Twitter 1054520180032778241, -- @kannmadoka 菅 まどか
            Twitter 1048871638651924480, -- @yagimashiro 八木 ましろ
            Twitter 1045274084743860224, -- @_shio_asuka 汐入 あすか
            Twitter 1043684232097218560, -- @Joey_Takeda 武田城以
            Twitter 1024177131918508032, -- @yukiyofujii0508 藤井ゆきよ
            Twitter 1021608964255928320, -- @tajimaru25 田嶌 紗蘭
            Twitter 1020287170542645248, -- @kmr_mayu213 木村 真悠
            Twitter 1020143964127547392, -- @kurumi_s_g 阪本久瑠実
            Twitter 1016599143584681989, -- @mo_chaam 元吉有希子
            Twitter 1016263042655404033, -- @kimurayuri1128 木村 悠里
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
            Twitter 947102043793080320, -- @rana_morishita 森下来奈
            Twitter 938719807255461888, -- @kaori_staff_ 石原夏織 STAFF
            Twitter 936189651630546947, -- @yahagi_sayuri 矢作紗友里
            Twitter 929249144610287616, -- @fugyuuuuu 高木遙香
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
            Twitter 867246335262699520, -- @tsuruari 鶴野 有紗
            Twitter 864554567505027072, -- @ShowMirai_music ミライショウ
            Twitter 854925939565776896, -- @_ayase_yu 綾瀬有
            Twitter 853074336248340481, -- @PA___NON PA-NON＆STAFF
            Twitter 840559363576102913, -- @eri1717171 久遠エリサ
            Twitter 838223630853033984, -- @canari_1111 あまり かなり7/4～音楽劇ジップ&キャンディ🤖7/29～舞台pet🐠8/21～舞台コジコジ😺
            Twitter 838047638314348544, -- @eri_usagi_ 河上 英里子
            Twitter 836824793521537024, -- @momokawa_rika 桃河りか
            Twitter 836749521887477760, -- @shiori_muto0722 武藤志織🧂
            Twitter 825270189264506880, -- @reina_kondo 近藤玲奈
            Twitter 814328637407264769, -- @Matsurica_staff マツリカ団
            Twitter 811124387495616512, -- @ibuking_1114 木戸衣吹
            Twitter 802124249628409856, -- @rui_harinezumi 苅谷瑠衣
            Twitter 787531199895920640, -- @tamura_kyoka 田村響華
            Twitter 771620400044265472, -- @fujisanyuui 藤山由依
            Twitter 767928161153654784, -- @Arisa_Aihara_ 愛原ありさ
            Twitter 766912527368228864, -- @MachicoOfficial Machico Official
            Twitter 760025194383585280, -- @Takase_Aiko 高瀬愛虹（たかせあいこ）
            Twitter 749885881318727681, -- @numakura_manami 沼倉愛美
            Twitter 748671603127398400, -- @aibaaiai 相羽あいな
            Twitter 737989496365449217, -- @InfoItomiku 伊藤美来 公式info
            Twitter 730754632062898176, -- @nagatsumajuri 長妻樹里
            Twitter 729856832097783808, -- @mako_komaki 小槙まこ
            Twitter 725372244982042625, -- @akari_w_tpd 脇あかり(TPD)
            Twitter 717695586393165825, -- @mm_1shi8 石橋桃
            Twitter 715373955041796096, -- @tomoyo_t_1014 高柳知葉
            Twitter 709265233399787520, -- @Yurie_Funato 船戸ゆり絵
            Twitter 4803314774, -- @spspring1234 伏見はる香
            Twitter 4784046656, -- @Hsan_realAcc 廣瀬千夏 ｰヒロセチナツｰ
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
            Twitter 3120590845, -- @renamaeda07 前田玲奈(◜‧̮◝ )
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
            Twitter 2807026892, -- @satohina1223 佐藤日向
            Twitter 2665092121, -- @maruasahina 朝日奈丸佳
            Twitter 2640398808, -- @nonremuq 石井玲歌
            Twitter 2596481180, -- @Lynn_0601_ Ｌｙｎｎ (りん)
            Twitter 2587770060, -- @okome_satomai 佐藤 舞🌾🍚
            Twitter 2574392995, -- @nagaku_yuki 長久友紀@がっきゅ
            Twitter 2574385454, -- @yuri_nogu のぐちゆり
            Twitter 2570625481, -- @bknb_mew みゆはん
            Twitter 2563725608, -- @the_kwmr 河村 梨恵
            Twitter 2548258832, -- @deet_ic 馬場莉乃
            Twitter 2471285462, -- @jullie_egg 木村珠莉
            Twitter 2445518118, -- @takamori_723 高森奈津美
            Twitter 2384778510, -- @iRis_s_yu 芹澤優(i☆Ris)
            Twitter 2365137780, -- @morita_suzuka 森田涼花
            Twitter 2361241964, -- @satosatomi58 佐藤聡美。
            Twitter 2308569924, -- @hinappp8 木野日菜
            Twitter 2293843940, -- @andyll25252 安藤尚也🦔
            Twitter 2292118700, -- @OnoSaki1126 小野 早稀(おの さき)
            Twitter 2275197806, -- @ckik195 築田行子
            Twitter 2237565500, -- @ohagidaisuki226 田口実加
            Twitter 2203143757, -- @nojomiy 山本希望
            Twitter 2186330749, -- @michuell_bunny 未来みき＊大天使みしゅえる⸜(´ ˘ `∗)⸝🔥
            Twitter 2171654186, -- @EggLuv07 柳原 かなこ
            Twitter 2168328588, -- @Ma2Ndayodayo 松尾祐輔
            Twitter 1978598388, -- @jiena_gaim 鷲見友美ジェナ(仮面ライダーGIRLS)
            Twitter 1968534385, -- @Galsyumcr SYU
            Twitter 1710115531, -- @Yuna_tani 谷口夢奈
            Twitter 1662016370, -- @karin_takahashi 高橋花林
            Twitter 1604926548, -- @NomotoHotaru 野本ほたる
            Twitter 1591053330, -- @miria_t 高岸美里亜
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
            Twitter 1137490904, -- @yuanagae ❁ながえゆあ❁
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
            Twitter 622485131, -- @saima_nakano 中野 さいま
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
            Twitter 324846333, -- @s_a_k_u_r_a_k 佐倉薫☪︎.°
            Twitter 315002109, -- @hiroseyuuki 広瀬ゆうき
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
            Twitter 177876675, -- @_mami_26p 内田愛美(うちだまみ)
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
            Twitter 134968429, -- @ayumaro0424 真野あゆみ
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
            Twitter 104776538, -- @nazukakaori 名塚佳織
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
          ]
        }
      ]
    # ( let topics =
            -- 日英バイリンガルアカウント
              [
                Twitter 357183969, -- @Kyokalovesanime 京香 Kyoka
              ]

        in  [ Pipitor.Rule::{
              , -- 日本語投稿
                filter = Some Pipitor.Filter::{
                , title = rx.hash filter.individual.ja
                }
              , outbox = [ Pipitor.Outbox.Twitter account.pipitorIndv ]
              , topics
              }
            , Pipitor.Rule::{
              , -- English posts
                filter = Some Pipitor.Filter::{
                , title = rx.hash filter.individual.en
                }
              , exclude =
                  -- 多重リツイートの抑止。日本語を優先する
                  Some Pipitor.Filter::{ title = rx.hash filter.individual.ja }
              , outbox = [ Pipitor.Outbox.Twitter account.pipitorIntl ]
              , topics
              }
            ]
      )
    # [ Pipitor.Rule::{
        , -- English
          filter = Some Pipitor.Filter::{ title = filter.individual.common }
        , outbox = [ Pipitor.Outbox.Twitter account.pipitorIntl ]
        , topics = [
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
          ]
        }
      , Pipitor.Rule::{
        , -- 配信者・VTuber
          filter = Some Pipitor.Filter::{
          , title = rx.any [ filter.individual.common, filter.kemovAnimalNameHashtags ]
          }
        , outbox = [ Pipitor.Outbox.Twitter account.pipitorIndv ]
        , topics = [
            Twitter 1122810226153938944, -- @7216_2nd まちゅり໒꒱· ﾟ
          ]
        }
      ]
