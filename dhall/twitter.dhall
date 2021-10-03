let Pipitor = ./Pipitor.dhall

let account = ./account.dhall

in Pipitor.Twitter::{
  user = account.pipitor,
  list = Some Pipitor.TwitterList::{
    id = 1121823136167542784, --| @KF_pipitor/list
    delay = { secs = 1, nanos = 500000000 },
  },
}
