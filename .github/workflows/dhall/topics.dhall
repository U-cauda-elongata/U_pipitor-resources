let List/concatMap =
      https://prelude.dhall-lang.org/v21.0.0/List/concatMap.dhall
        sha256:3b2167061d11fda1e4f6de0522cbe83e0d5ac4ef5ddf6bb0b2064470c5d3fb64

let Pipitor = ../../../dhall/Pipitor.dhall

let rule = (../../../Pipitor.dhall).rule

let topics
    : List Pipitor.Topic
    = List/concatMap
        Pipitor.Rule.Type
        Pipitor.Topic
        (\(rule : Pipitor.Rule.Type) -> rule.topics)
        rule

in  topics
