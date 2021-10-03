let Pipitor = ./Pipitor.dhall

let Text/concatSep =
      https://prelude.dhall-lang.org/v20.2.0/Text/concatSep sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58
let List/map =
      https://prelude.dhall-lang.org/v20.2.0/List/map sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

--| 空白・コメント行および大文字小文字の違いを無視する
let i = \(expr : Text) -> "(?i:${expr})"

--| 引数のパターンのハッシュタグにマッチする
let hash = \(expr : Text) -> "[\\#＃](?:${expr})"

--| 引数のリストのいずれかの要素のパターンにマッチする
let any =
      \(exprs : List Text) ->
        Text/concatSep
          "|"
          (List/map Text Text (\(expr : Text) -> "(?:${expr})") exprs)

--| 正規表現生成用のユーティリティー
let rx = {
  i,
  hash,
  any,
}

--| YouTube の channel id に対応する WebSub トピックを返す
let youtube =
      \(channelId : Text) ->
        Pipitor.Topic.Feed
          "https://www.youtube.com/xml/feeds/videos.xml?channel_id=${channelId}"

in { rx, youtube }
