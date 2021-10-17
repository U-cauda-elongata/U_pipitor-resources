--| YouTube の channel id に対応する WebSub トピックを返す
let Pipitor = ../Pipitor.dhall

let youtube
    : Text -> Pipitor.Topic
    = \(channelId : Text) ->
        Pipitor.Topic.Feed
          "https://www.youtube.com/xml/feeds/videos.xml?channel_id=${channelId}"

in  youtube
