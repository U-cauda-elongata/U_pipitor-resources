{-|
パターン中の英数字・記号・カタカナを半角・全角のいずれにもマッチするようにする（Width Insensitive）。

`x` から `[xｘ]` への単純置換のため、エスケープシーケンスを含むパターンに使用すると誤った結果になるので要注意。
-}
let List/map =
      https://prelude.dhall-lang.org/v22.0.0/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let table =
      [ { half = " ", full = "　" }
      , { half = "!", full = "！" }
      , { half = "\"", full = "＂" }
      , { half = "#", full = "＃" }
      , { half = "\\\$", full = "＄" }
      , { half = "%", full = "％" }
      , { half = "\\&", full = "＆" }
      , { half = "'", full = "＇" }
      , { half = "\\(", full = "（" }
      , { half = "\\)", full = "）" }
      , { half = "\\*", full = "＊" }
      , { half = "\\+", full = "＋" }
      , { half = "\\,", full = "，" }
      , { half = "\\-", full = "－" }
      , { half = "\\.", full = "．" }
      , { half = "/", full = "／" }
      , { half = "0", full = "０" }
      , { half = "1", full = "１" }
      , { half = "2", full = "２" }
      , { half = "3", full = "３" }
      , { half = "4", full = "４" }
      , { half = "5", full = "５" }
      , { half = "6", full = "６" }
      , { half = "7", full = "７" }
      , { half = "8", full = "８" }
      , { half = "9", full = "９" }
      , { half = ":", full = "：" }
      , { half = ";", full = "；" }
      , { half = "<", full = "＜" }
      , { half = "=", full = "＝" }
      , { half = ">", full = "＞" }
      , { half = "\\?", full = "？" }
      , { half = "@", full = "＠" }
      , { half = "A", full = "Ａ" }
      , { half = "B", full = "Ｂ" }
      , { half = "C", full = "Ｃ" }
      , { half = "D", full = "Ｄ" }
      , { half = "E", full = "Ｅ" }
      , { half = "F", full = "Ｆ" }
      , { half = "G", full = "Ｇ" }
      , { half = "H", full = "Ｈ" }
      , { half = "I", full = "Ｉ" }
      , { half = "J", full = "Ｊ" }
      , { half = "K", full = "Ｋ" }
      , { half = "L", full = "Ｌ" }
      , { half = "M", full = "Ｍ" }
      , { half = "N", full = "Ｎ" }
      , { half = "O", full = "Ｏ" }
      , { half = "P", full = "Ｐ" }
      , { half = "Q", full = "Ｑ" }
      , { half = "R", full = "Ｒ" }
      , { half = "S", full = "Ｓ" }
      , { half = "T", full = "Ｔ" }
      , { half = "U", full = "Ｕ" }
      , { half = "V", full = "Ｖ" }
      , { half = "W", full = "Ｗ" }
      , { half = "X", full = "Ｘ" }
      , { half = "Y", full = "Ｙ" }
      , { half = "Z", full = "Ｚ" }
      , { half = "\\[", full = "［" }
      , { half = "\\\\", full = "＼" }
      , { half = "\\]", full = "］" }
      , { half = "\\^", full = "＾" }
      , { half = "_", full = "＿" }
      , { half = "`", full = "｀" }
      , { half = "a", full = "ａ" }
      , { half = "b", full = "ｂ" }
      , { half = "c", full = "ｃ" }
      , { half = "d", full = "ｄ" }
      , { half = "e", full = "ｅ" }
      , { half = "f", full = "ｆ" }
      , { half = "g", full = "ｇ" }
      , { half = "h", full = "ｈ" }
      , { half = "i", full = "ｉ" }
      , { half = "j", full = "ｊ" }
      , { half = "k", full = "ｋ" }
      , { half = "l", full = "ｌ" }
      , { half = "m", full = "ｍ" }
      , { half = "n", full = "ｎ" }
      , { half = "o", full = "ｏ" }
      , { half = "p", full = "ｐ" }
      , { half = "q", full = "ｑ" }
      , { half = "r", full = "ｒ" }
      , { half = "s", full = "ｓ" }
      , { half = "t", full = "ｔ" }
      , { half = "u", full = "ｕ" }
      , { half = "v", full = "ｖ" }
      , { half = "w", full = "ｗ" }
      , { half = "x", full = "ｘ" }
      , { half = "y", full = "ｙ" }
      , { half = "z", full = "ｚ" }
      , { half = "\\{", full = "｛" }
      , { half = "\\|", full = "｜" }
      , { half = "\\}", full = "｝" }
      , { half = "\\~", full = "～" }
      , { half = "｡", full = "。" }
      , { half = "｢", full = "「" }
      , { half = "｣", full = "」" }
      , { half = "､", full = "、" }
      , { half = "･", full = "・" }
      , { half = "ｦ", full = "ヲ" }
      , { half = "ｧ", full = "ァ" }
      , { half = "ｨ", full = "ィ" }
      , { half = "ｩ", full = "ゥ" }
      , { half = "ｪ", full = "ェ" }
      , { half = "ｫ", full = "ォ" }
      , { half = "ｬ", full = "ャ" }
      , { half = "ｭ", full = "ュ" }
      , { half = "ｮ", full = "ョ" }
      , { half = "ｯ", full = "ッ" }
      , { half = "ｰ", full = "ー" }
      , { half = "ｱ", full = "ア" }
      , { half = "ｲ", full = "イ" }
      , { half = "ｳ", full = "ウ" }
      , { half = "ｳﾞ", full = "ヴ" }
      , { half = "ｴ", full = "エ" }
      , { half = "ｵ", full = "オ" }
      , { half = "ｶ", full = "カ" }
      , { half = "ｶﾞ", full = "ガ" }
      , { half = "ｷ", full = "キ" }
      , { half = "ｷﾞ", full = "ギ" }
      , { half = "ｸ", full = "ク" }
      , { half = "ｸﾞ", full = "グ" }
      , { half = "ｹ", full = "ケ" }
      , { half = "ｹﾞ", full = "ゲ" }
      , { half = "ｺ", full = "コ" }
      , { half = "ｺﾞ", full = "ゴ" }
      , { half = "ｻ", full = "サ" }
      , { half = "ｻﾞ", full = "ザ" }
      , { half = "ｼ", full = "シ" }
      , { half = "ｼﾞ", full = "ジ" }
      , { half = "ｽ", full = "ス" }
      , { half = "ｽﾞ", full = "ズ" }
      , { half = "ｾ", full = "セ" }
      , { half = "ｾﾞ", full = "ゼ" }
      , { half = "ｿ", full = "ソ" }
      , { half = "ｿﾞ", full = "ゾ" }
      , { half = "ﾀ", full = "タ" }
      , { half = "ﾀﾞ", full = "ダ" }
      , { half = "ﾁ", full = "チ" }
      , { half = "ﾁﾞ", full = "ヂ" }
      , { half = "ﾂ", full = "ツ" }
      , { half = "ﾂﾞ", full = "ヅ" }
      , { half = "ﾃ", full = "テ" }
      , { half = "ﾃﾞ", full = "デ" }
      , { half = "ﾄ", full = "ト" }
      , { half = "ﾄﾞ", full = "ド" }
      , { half = "ﾅ", full = "ナ" }
      , { half = "ﾆ", full = "ニ" }
      , { half = "ﾇ", full = "ヌ" }
      , { half = "ﾈ", full = "ネ" }
      , { half = "ﾉ", full = "ノ" }
      , { half = "ﾊ", full = "ハ" }
      , { half = "ﾊﾞ", full = "バ" }
      , { half = "ﾊﾟ", full = "パ" }
      , { half = "ﾋ", full = "ヒ" }
      , { half = "ﾋﾞ", full = "ビ" }
      , { half = "ﾋﾟ", full = "ピ" }
      , { half = "ﾌ", full = "フ" }
      , { half = "ﾌﾞ", full = "ブ" }
      , { half = "ﾌﾟ", full = "プ" }
      , { half = "ﾍ", full = "ヘ" }
      , { half = "ﾍﾞ", full = "ベ" }
      , { half = "ﾍﾟ", full = "ペ" }
      , { half = "ﾎ", full = "ホ" }
      , { half = "ﾎﾞ", full = "ボ" }
      , { half = "ﾎﾟ", full = "ポ" }
      , { half = "ﾏ", full = "マ" }
      , { half = "ﾐ", full = "ミ" }
      , { half = "ﾑ", full = "ム" }
      , { half = "ﾒ", full = "メ" }
      , { half = "ﾓ", full = "モ" }
      , { half = "ﾔ", full = "ヤ" }
      , { half = "ﾕ", full = "ユ" }
      , { half = "ﾖ", full = "ヨ" }
      , { half = "ﾗ", full = "ラ" }
      , { half = "ﾘ", full = "リ" }
      , { half = "ﾙ", full = "ル" }
      , { half = "ﾚ", full = "レ" }
      , { half = "ﾛ", full = "ロ" }
      , { half = "ﾜ", full = "ワ" }
      , { half = "ﾝ", full = "ン" }
      ]

let replacements =
    -- `ガ` -> `[ｶﾞガ]` -> `[[ｶカ]ﾞガ]` のような二重の置換を防ぐために、半角文字を全て全角文字に置換してから
    -- 全角文字をクラスに置換する。
        List/map
          { half : Text, full : Text }
          (Text -> Text)
          ( \(map : { half : Text, full : Text }) ->
              Text/replace map.full "[${map.half}${map.full}]"
          )
          table
      # List/map
          { half : Text, full : Text }
          (Text -> Text)
          ( \(map : { half : Text, full : Text }) ->
              Text/replace map.half map.full
          )
          table

let wi
    : Text -> Text
    = List/fold
        (Text -> Text)
        replacements
        Text
        (\(replacement : Text -> Text) -> replacement)

let example0 =
        assert
      :     wi "Hello, world!"
        ===  "[HＨ][eｅ][lｌ][lｌ][oｏ],[ 　][wｗ][oｏ][rｒ][lｌ][dｄ][!！]"

let example1 =
      assert : wi "ハロー、ワールド！" === "[ﾊハ][ﾛロ][ｰー][､、][ﾜワ][ｰー][ﾙル][ﾄﾞド][!！]"

in  wi
