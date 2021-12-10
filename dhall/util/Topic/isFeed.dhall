let Topic = (../../Pipitor.dhall).Topic

let Topic/isFeed
    : Topic -> Bool
    = \(topic : Topic) ->
        merge
          { Feed = \(_ : Text) -> True, Twitter = \(_ : Natural) -> False }
          topic

in  Topic/isFeed
