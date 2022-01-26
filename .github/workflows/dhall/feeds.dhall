let List/filterMap =
      https://prelude.dhall-lang.org/v22.0.0/List/filterMap.dhall
        sha256:94b7ed4204d1c79aaf55527ef51024e7085b8dd2896952cffbd12d8f95e16f46

let Topic = (../../../dhall/Pipitor.dhall).Topic

let feeds =
      List/filterMap
        Topic
        Text
        ( \(topic : Topic) ->
            merge
              { Feed = \(uri : Text) -> Some uri
              , Twitter = \(_ : Natural) -> None Text
              }
              topic
        )
        ./topics.dhall

let feeds
    : Text
    = ./puts.dhall feeds

in  feeds
