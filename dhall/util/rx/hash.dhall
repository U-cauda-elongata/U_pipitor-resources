--| 引数のパターンのハッシュタグにマッチする
let hash
    : Text -> Text
    = \(expr : Text) -> "[\\#＃](?:${expr})"

in  hash
