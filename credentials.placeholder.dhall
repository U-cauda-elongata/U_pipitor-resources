let Pipitor =
      https://github.com/tesaguri/pipitor/raw/dhall-schema-v0.3.0-alpha.13/schema.dhall sha256:7cda9e784009d372f4b6272be2487647cfa02587faceb2c746b94927c4dec3fc

in  { twitter.client = { identifier = "", secret = "" }
    , websub = None Pipitor.WebSub.Type
    }
