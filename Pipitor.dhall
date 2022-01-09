let Pipitor = ./dhall/Pipitor.dhall

let twitter = ./dhall/twitter.dhall

let rule = ./dhall/rule.dhall

in  Pipitor.Manifest::{ twitter, rule }
