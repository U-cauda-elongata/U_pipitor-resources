let puts
    : List Text -> Text
    = \(texts : List Text) ->
        List/fold
          Text
          texts
          Text
          (\(text : Text) -> \(out : Text) -> out ++ text ++ "\n")
          ""

in  puts
