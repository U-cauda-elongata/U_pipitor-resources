let Topic = (../../Pipitor.dhall).Topic

let Topic/isFeed = ./isFeed.dhall

let Topic/isTwitter
    : Topic -> Bool
    = \(topic : Topic) -> Topic/isFeed topic == False

in  Topic/isTwitter
