--| けものフレンズ公式系
let Pipitor = ../Pipitor.dhall

let account = ../account.dhall

let Twitter = Pipitor.Topic.Twitter

let youtube = (../util.dhall).youtube

in  [ Pipitor.Rule::{
      , -- フィード用ルール
        filter =
          -- 全ての投稿がけものフレンズに関連するため `filter` は不要
          None Pipitor.Filter.Type
      , outbox = [ Pipitor.Outbox.Twitter account.pipitor ]
      , topics = [
          youtube "UCkixBP-HQPS0lOyCpdFWQEg", -- 東武ジャパリパーク
          youtube "UCEOugXOAfa-HRmRjKbH8z3Q", -- けものフレンズプロジェクト公式
        ]
      }
    , Pipitor.Rule::{
      , -- International
        filter = None Pipitor.Filter.Type
      , outbox = [ Pipitor.Outbox.Twitter account.pipitorIntl ]
      , topics = [
          youtube "UCWMgQDJsPAERC8ENR2V3iHw", -- 動物朋友:王國
        ]
      }
    , Pipitor.Rule::{
      , -- けもＶ
        filter = None Pipitor.Filter.Type
      , outbox = [ Pipitor.Outbox.Twitter account.vpPipitor ]
      , topics = [
          youtube "UCmYO-WfY7Tasry4D1YB4LJw", -- フンボルトペンギン / Humboldt Penguin
          youtube "UCdNBhcAohYjXlUVYsz8X2KQ", -- ダイアウルフ / Dire Wolf
          youtube "UCabMjG8p6G5xLkPJgEoTnDg", -- コヨーテ / Coyote
          youtube "UCMpw36mXEu3SLsqdrJxUKNA", -- シマハイイロギツネ / Island Fox
          youtube "UCEcMIuGR8WO2TwL9XIpjKtw", -- ケープペンギン / African Penguin
        ]
      }
    , Pipitor.Rule::{
      , -- Twitter アカウント用ルール
        filter = None Pipitor.Filter.Type
      , outbox =
          -- これらのアカウント宛のリプライを捕捉するために便宜的にルールに加えているが、
          -- Twitter の場合はそれぞれのアカウントをフォローすれば事足りるためリツイートの対象とはしない。
          [] : List Pipitor.Outbox
      , topics = [
          Twitter 1503340095239495682, -- @KFKSGMY 动物朋友-王国
          Twitter 1444527872689930245, -- @tiktam_official ちく☆たむ オフィシャル
          Twitter 1404316984175599619, -- @KEMOVP_staff パークスタッフ
          Twitter 1396771594924564485, -- @Shimahai_KEMOV シマハイイロギツネ🏝🦊
          Twitter 1396750022541144071, -- @Direwolf_KEMOV ダイアウルフ
          Twitter 1396751372712779778, -- @Coyote_KEMOV Coyote
          Twitter 1385528731322621957, -- @Hululu_KEMOV フンボルトペンギン🔩🐧
          Twitter 1385501300981338113, -- @Cape_KEMOV ケープペンギン
          Twitter 1258240637368799233, -- @X_JPD_official ❌【official】×ジャパリ団　広報団員❌
          Twitter 1148893601813843969, -- @kemofrie3locate けものフレンズ３＠ロケテ情報
          Twitter 1102890198411632641, -- @kemofure_yakata 【公式】けものフレンズ屋形船～輝きを追いかけて～
          Twitter 1090197229556486144, -- @Gothic_Luck Gothic×Luck 公式
          Twitter 1075640900414570497, -- @jppzootobu 【公式】東武ジャパリパーク
          Twitter 1073098190868508677, -- @kemono_friends3 けものフレンズ３＠公式アカウント
          Twitter 1068364107198296066, -- @smcc_kemono 三井住友カード×けものフレンズ
          Twitter 1036212563300610048, -- @kemono_anime 【公式】けものフレンズ２アニメ
          Twitter 971715886808576001, -- @kemono_festival 【公式】けものフレンズ FESTIVAL
          Twitter 909669017295523840, -- @kemono_pavilion けものフレンズぱびりおん【公式】
          Twitter 874816424522391553, -- @kemono_matsuri お祭だよ！けものフレンズがーでん
          Twitter 855370277739311104, -- @kemono_butai 【公式】舞台「けものフレンズ」
          Twitter 2801592695, -- @kemo_project けものフレンズ＠公式アカウント
        ]
      }
    ]
