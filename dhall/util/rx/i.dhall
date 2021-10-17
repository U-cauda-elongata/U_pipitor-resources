--| 空白・コメント行および大文字小文字の違いを無視する
let i
    : Text -> Text
    = \(expr : Text) -> "(?i:${expr})"

in  i
