let Pipitor = ./Pipitor.dhall

let account = ./account.dhall

in  Pipitor.Twitter::{
    , user = account.pipitor
    , list = Some Pipitor.TwitterList::{
      , id =
          -- @KF_pipitor/list
          1121823136167542784
      , delay = { secs = 1, nanos = 500000000 }
      }
    }
