let List/filterMap =
      https://prelude.dhall-lang.org/v22.0.0/List/filterMap.dhall
        sha256:94b7ed4204d1c79aaf55527ef51024e7085b8dd2896952cffbd12d8f95e16f46

let Topic = (../../../dhall/Pipitor.dhall).Topic

let twitter =
      List/filterMap
        Topic
        Text
        ( \(topic : Topic) ->
            merge
              { Feed = \(_ : Text) -> None Text
              , Twitter = \(id : Natural) -> Some (Natural/show id)
              }
              topic
        )
        ./topics.dhall

let twitter
    : Text
    = ./puts.dhall twitter

in  twitter
