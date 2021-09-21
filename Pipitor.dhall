let Pipitor =
  https://raw.githubusercontent.com/tesaguri/pipitor/dhall-schema-v0.3.0-alpha.9/schema.dhall sha256:08f433d482a6e6354598d74264693100b411a4873166dfe953119c97310d7a0d

let account = ./dhall/account.dhall
let rule = ./dhall/rule.dhall

let twitter = Pipitor.Twitter::{
  user = account.pipitor,
  list = Some Pipitor.TwitterList::{
    id = 1121823136167542784, --| @KF_pipitor/list
    delay = { secs = 1, nanos = 500000000 },
  },
}

in Pipitor.Manifest::{ twitter, rule }
