{-|
パターン中の半角英数字を半角・全角のいずれにもマッチするようにする（Width Insensitive）。

`x` から `[xｘ]` への単純置換のため、`[]` やエスケープシーケンスを含むパターンに使用すると誤った結果になるので注意。
-}
let List/foldLeft =
      https://prelude.dhall-lang.org/v20.2.0/List/foldLeft.dhall
        sha256:3c6ab57950fe644906b7bbdef0b9523440b6ee17773ebb8cbd41ffacb8bfab61

let wi
    : Text -> Text
    = List/fold
        (Text -> Text)
        [ Text/replace "0" "[0０]"
        , Text/replace "1" "[1１]"
        , Text/replace "2" "[2２]"
        , Text/replace "3" "[3３]"
        , Text/replace "4" "[4４]"
        , Text/replace "5" "[5５]"
        , Text/replace "6" "[6６]"
        , Text/replace "7" "[7７]"
        , Text/replace "8" "[8８]"
        , Text/replace "9" "[9９]"
        , Text/replace "A" "[AＡ]"
        , Text/replace "B" "[BＢ]"
        , Text/replace "C" "[CＣ]"
        , Text/replace "D" "[DＤ]"
        , Text/replace "E" "[EＥ]"
        , Text/replace "F" "[FＦ]"
        , Text/replace "G" "[GＧ]"
        , Text/replace "H" "[HＨ]"
        , Text/replace "I" "[IＩ]"
        , Text/replace "J" "[JＪ]"
        , Text/replace "K" "[KＫ]"
        , Text/replace "L" "[LＬ]"
        , Text/replace "M" "[MＭ]"
        , Text/replace "N" "[NＮ]"
        , Text/replace "O" "[OＯ]"
        , Text/replace "P" "[PＰ]"
        , Text/replace "Q" "[QＱ]"
        , Text/replace "R" "[RＲ]"
        , Text/replace "S" "[SＳ]"
        , Text/replace "T" "[TＴ]"
        , Text/replace "U" "[UＵ]"
        , Text/replace "V" "[VＶ]"
        , Text/replace "W" "[WＷ]"
        , Text/replace "X" "[XＸ]"
        , Text/replace "Y" "[YＹ]"
        , Text/replace "Z" "[ZＺ]"
        , Text/replace "a" "[aａ]"
        , Text/replace "b" "[bｂ]"
        , Text/replace "c" "[cｃ]"
        , Text/replace "d" "[dｄ]"
        , Text/replace "e" "[eｅ]"
        , Text/replace "f" "[fｆ]"
        , Text/replace "g" "[gｇ]"
        , Text/replace "h" "[hｈ]"
        , Text/replace "i" "[iｉ]"
        , Text/replace "j" "[jｊ]"
        , Text/replace "k" "[kｋ]"
        , Text/replace "l" "[lｌ]"
        , Text/replace "m" "[mｍ]"
        , Text/replace "n" "[nｎ]"
        , Text/replace "o" "[oｏ]"
        , Text/replace "p" "[pｐ]"
        , Text/replace "q" "[qｑ]"
        , Text/replace "r" "[rｒ]"
        , Text/replace "s" "[sｓ]"
        , Text/replace "t" "[tｔ]"
        , Text/replace "u" "[uｕ]"
        , Text/replace "v" "[vｖ]"
        , Text/replace "w" "[wｗ]"
        , Text/replace "x" "[xｘ]"
        , Text/replace "y" "[yｙ]"
        , Text/replace "z" "[zｚ]"
        ]
        Text
        (\(replacement : Text -> Text) -> replacement)

let example =
        assert
      : wi "Hello, world!" === "[HＨ][eｅ][lｌ][lｌ][oｏ], [wｗ][oｏ][rｒ][lｌ][dｄ]!"

in  wi
