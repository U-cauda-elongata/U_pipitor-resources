--| 引数のパターンを接頭辞に持つハッシュタグにマッチする。
let hash
    : Text -> Text
    = \(expr : Text) -> "[\\#＃](?:${expr})"

in  hash
