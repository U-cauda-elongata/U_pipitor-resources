--| 引数のリストのいずれかの要素のパターンにマッチする
let List/map =
      https://prelude.dhall-lang.org/v20.2.0/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Text/concatSep =
      https://prelude.dhall-lang.org/v20.2.0/Text/concatSep.dhall
        sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let any
    : List Text -> Text
    = \(exprs : List Text) ->
        let body =
              Text/concatSep
                "|"
                (List/map Text Text (\(expr : Text) -> "(?:${expr})") exprs)

        in  "(?:${body})"

in  any
