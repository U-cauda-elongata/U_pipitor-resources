let Pipitor =
  https://raw.githubusercontent.com/tesaguri/pipitor/dhall-schema-v0.3.0-alpha.9/schema.dhall sha256:08f433d482a6e6354598d74264693100b411a4873166dfe953119c97310d7a0d

let twitter = ./dhall/twitter.dhall
let rule = ./dhall/rule.dhall

in Pipitor.Manifest::{ twitter, rule }
