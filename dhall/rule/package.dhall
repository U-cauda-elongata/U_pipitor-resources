let List/concat =
      https://prelude.dhall-lang.org/v21.1.0/List/concat.dhall
        sha256:54e43278be13276e03bd1afa89e562e94a0a006377ebea7db14c7562b0de292b

let Pipitor = ../Pipitor.dhall

in  List/concat
      Pipitor.Rule.Type
      [ ./kf-official.dhall
      , ./general.dhall
      , ./streamer.dhall
      , ./media.dhall
      , ./individual.dhall
      , ./zoo-aquarium.dhall
      ]
