let List/map =
      https://prelude.dhall-lang.org/v21.0.0/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let List/unpackOptionals =
      https://prelude.dhall-lang.org/v21.0.0/List/unpackOptionals.dhall
        sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let Topic = (../../../dhall/Pipitor.dhall).Topic

let twitter =
      List/unpackOptionals
        Text
        ( List/map
            Topic
            (Optional Text)
            ( \(topic : Topic) ->
                merge
                  { Feed = \(_ : Text) -> None Text
                  , Twitter = \(id : Natural) -> Some (Natural/show id)
                  }
                  topic
            )
            ./topics.dhall
        )

let twitter
    : Text
    = ./puts.dhall twitter

in  twitter
