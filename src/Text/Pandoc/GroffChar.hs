{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-
Copyright (C) 2018 John MacFarlane <jgm@berkeley.edu>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-}

{- |
   Module      : Text.Pandoc.GroffChar
   Copyright   : Copyright (C) 2007-2018 John MacFarlane
   License     : GNU GPL, version 2 or above

   Maintainer  : John MacFarlane <jgm@berkeley.edu>
   Stability   : alpha
   Portability : portable

Groff character escaping/unescaping.
-}

module Text.Pandoc.GroffChar (
    essentialEscapes
  , characterCodes
  , combiningAccents
  ) where
import Prelude
import qualified Data.Map as Map

essentialEscapes :: Map.Map Char String
essentialEscapes = Map.fromList
  [ ('\160', "\\~")
  , ('\'', "\\[aq]")
  , ('`', "\\[ga]")
  , ('"', "\\[dq]")
  , ('~', "\\[ti]")
  , ('^', "\\[ha]")
  , ('@', "\\[at]")
  , ('\\', "\\[rs]")
  , ('\x2026', "\\&...")  -- because u2026 doesn't render on tty
  , ('\x2212', "\\-")  -- minus
  ]

characterCodes :: [(Char, String)]
characterCodes =
  [ ('Ð', "-D")
  , ('ð', "Sd")
  , ('Þ', "TP")
  , ('þ', "Tp")
  , ('ß', "ss")
  , ('ﬀ', "ff")
  , ('ﬁ', "fi")
  , ('ﬂ', "fl")
  , ('ﬃ', "Fi")
  , ('ﬄ', "Fl")
  , ('Ł', "/L")
  , ('ł', "/l")
  , ('Ø', "/O")
  , ('ø', "/o")
  , ('Æ', "AE")
  , ('æ', "ae")
  , ('Œ', "OE")
  , ('œ', "oe")
  , ('Ĳ', "IJ")
  , ('ĳ', "ij")
  , ('ı', ".i")
  , ('ȷ', ".j")
  , ('Á', "'A")
  , ('Ć', "'C")
  , ('É', "'E")
  , ('Í', "'I")
  , ('Ó', "'O")
  , ('Ú', "'U")
  , ('Ý', "'Y")
  , ('á', "'a")
  , ('ć', "'c")
  , ('é', "'e")
  , ('í', "'i")
  , ('ó', "'o")
  , ('ú', "'u")
  , ('ý', "'y")
  , ('Ä', ":A")
  , ('Ë', ":E")
  , ('Ï', ":I")
  , ('Ö', ":O")
  , ('Ü', ":U")
  , ('Ÿ', ":Y")
  , ('ä', ":a")
  , ('ë', ":e")
  , ('ï', ":i")
  , ('ö', ":o")
  , ('ü', ":u")
  , ('ÿ', ":y")
  , ('Â', "^A")
  , ('Ê', "^E")
  , ('Î', "^I")
  , ('Ô', "^O")
  , ('Û', "^U")
  , ('â', "^a")
  , ('ê', "^e")
  , ('î', "^i")
  , ('ô', "^o")
  , ('û', "^u")
  , ('À', "`A")
  , ('È', "`E")
  , ('Ì', "`I")
  , ('Ò', "`O")
  , ('Ù', "`U")
  , ('à', "`a")
  , ('è', "`e")
  , ('ì', "`i")
  , ('ò', "`o")
  , ('ù', "`u")
  , ('Ã', "~A")
  , ('Ñ', "~N")
  , ('Õ', "~O")
  , ('ã', "~a")
  , ('ñ', "~n")
  , ('õ', "~o")
  , ('Š', "vS")
  , ('š', "vs")
  , ('Ž', "vZ")
  , ('ž', "vz")
  , ('Ç', ",C")
  , ('ç', ",c")
  , ('Å', "oA")
  , ('å', "oa")
  , ('˝', "a\"")
  , ('¯', "a-")
  , ('˙', "a.")
  , ('^', "a^")
  , ('´', "aa")
  , ('`', "ga")
  , ('˘', "ab")
  , ('¸', "ac")
  , ('¨', "ad")
  , ('ˇ', "ah")
  , ('˚', "ao")
  , ('~', "a~")
  , ('˛', "ho")
  , ('^', "ha")
  , ('~', "ti")
  , ('„', "Bq")
  , ('‚', "bq")
  , ('“', "lq")
  , ('”', "rq")
  , ('‘', "oq")
  , ('’', "cq")
  , ('\'', "aq")
  , ('"', "dq")
  , ('«', "Fo")
  , ('»', "Fc")
  , ('‹', "fo")
  , ('›', "fc")
  , ('¡', "r!")
  , ('¿', "r?")
  , ('—', "em")
  , ('–', "en")
  , ('‐', "hy")
  , ('[', "lB")
  , (']', "rB")
  , ('{', "lC")
  , ('}', "rC")
  , ('⟨', "la")
  , ('⟩', "ra")
  , ('⎪', "bv")
  , ('⎪', "braceex")
  , ('⎡', "bracketlefttp")
  , ('⎣', "bracketleftbt")
  , ('⎢', "bracketleftex")
  , ('⎤', "bracketrighttp")
  , ('⎦', "bracketrightbt")
  , ('⎥', "bracketrightex")
  , ('╭', "lt")
  , ('⎧', "bracelefttp")
  , ('┥', "lk")
  , ('⎨', "braceleftmid")
  , ('╰', "lb")
  , ('⎩', "braceleftbt")
  , ('⎪', "braceleftex")
  , ('╮', "rt")
  , ('⎫', "bracerighttp")
  , ('┝', "rk")
  , ('⎬', "bracerightmid")
  , ('╯', "rb")
  , ('⎭', "bracerightbt")
  , ('⎪', "bracerightex")
  , ('⎛', "parenlefttp")
  , ('⎝', "parenleftbt")
  , ('⎜', "parenleftex")
  , ('⎞', "parenrighttp")
  , ('⎠', "parenrightbt")
  , ('⎟', "parenrightex")
  , ('←', "<-")
  , ('→', "->")
  , ('↔', "<>")
  , ('↓', "da")
  , ('↑', "ua")
  , ('↕', "va")
  , ('⇐', "lA")
  , ('⇒', "rA")
  , ('⇔', "hA")
  , ('⇓', "dA")
  , ('⇑', "uA")
  , ('⇕', "vA")
  , ('⎯', "an")
  , ('|', "ba")
  , ('│', "br")
  , ('_', "ul")
  , ('‾', "rn")
  , ('_', "ru")
  , ('¦', "bb")
  , ('/', "sl")
  , ('\\', "rs")
  , ('○', "ci")
  , ('·', "bu")
  , ('‡', "dd")
  , ('†', "dg")
  , ('◊', "lz")
  , ('□', "sq")
  , ('¶', "ps")
  , ('§', "sc")
  , ('☜', "lh")
  , ('☞', "rh")
  , ('@', "at")
  , ('#', "sh")
  , ('↵', "CR")
  , ('✓', "OK")
  , ('©', "co")
  , ('®', "rg")
  , ('™', "tm")
  , ('$', "Do")
  , ('¢', "ct")
  , ('€', "eu")
  , ('€', "Eu")
  , ('¥', "Ye")
  , ('£', "Po")
  , ('¤', "Cs")
  , ('ƒ', "Fn")
  , ('°', "de")
  , ('‰', "%0")
  , ('′', "fm")
  , ('″', "sd")
  , ('µ', "mc")
  , ('ª', "Of")
  , ('º', "Om")
  , ('∧', "AN")
  , ('∨', "OR")
  , ('¬', "no")
  , ('¬', "tno")
  , ('∃', "te")
  , ('∀', "fa")
  , ('∋', "st")
  , ('∴', "3d")
  , ('∴', "tf")
  , ('|', "or")
  , ('½', "12")
  , ('¼', "14")
  , ('¾', "34")
  , ('⅛', "18")
  , ('⅜', "38")
  , ('⅝', "58")
  , ('⅞', "78")
  , ('¹', "S1")
  , ('²', "S2")
  , ('³', "S3")
  , ('+', "pl")
  , ('−', "mi")
  , ('∓', "-+")
  , ('±', "+-")
  , ('±', "t+-")
  , ('·', "pc")
  , ('⋅', "md")
  , ('×', "mu")
  , ('×', "tmu")
  , ('⊗', "c*")
  , ('⊕', "c+")
  , ('÷', "di")
  , ('÷', "tdi")
  , ('⁄', "f/")
  , ('∗', "**")
  , ('≤', "<=")
  , ('≥', ">=")
  , ('≪', "<<")
  , ('≫', ">>")
  , ('=', "eq")
  , ('≠', "!=")
  , ('≡', "==")
  , ('≢', "ne")
  , ('≅', "=~")
  , ('≃', "|=")
  , ('∼', "ap")
  , ('≈', "~~")
  , ('≈', "~=")
  , ('∝', "pt")
  , ('∅', "es")
  , ('∈', "mo")
  , ('∉', "nm")
  , ('⊂', "sb")
  , ('⊄', "nb")
  , ('⊃', "sp")
  , ('⊅', "nc")
  , ('⊆', "ib")
  , ('⊇', "ip")
  , ('∩', "ca")
  , ('∪', "cu")
  , ('∠', "/_")
  , ('⊥', "pp")
  , ('∫', "is")
  , ('∫', "integral")
  , ('∑', "sum")
  , ('∏', "product")
  , ('∐', "coproduct")
  , ('∇', "gr")
  , ('√', "sr")
  , ('√', "sqrt")
  -- , "radicalex"
  -- "sqrtex"
  , ('⌈', "lc")
  , ('⌉', "rc")
  , ('⌊', "lf")
  , ('⌋', "rf")
  , ('∞', "if")
  , ('ℵ', "Ah")
  , ('ℑ', "Im")
  , ('ℜ', "Re")
  , ('℘', "wp")
  , ('∂', "pd")
  , ('ℏ', "-h")
  , ('ℏ', "hbar")
  , ('Α', "*A")
  , ('Β', "*B")
  , ('Γ', "*G")
  , ('Δ', "*D")
  , ('Ε', "*E")
  , ('Ζ', "*Z")
  , ('Η', "*Y")
  , ('Θ', "*H")
  , ('Ι', "*I")
  , ('Κ', "*K")
  , ('Λ', "*L")
  , ('Μ', "*M")
  , ('Ν', "*N")
  , ('Ξ', "*C")
  , ('Ο', "*O")
  , ('Π', "*P")
  , ('Ρ', "*R")
  , ('Σ', "*S")
  , ('Τ', "*T")
  , ('Υ', "*U")
  , ('Φ', "*F")
  , ('Χ', "*X")
  , ('Ψ', "*Q")
  , ('Ω', "*W")
  , ('α', "*a")
  , ('β', "*b")
  , ('γ', "*g")
  , ('δ', "*d")
  , ('ε', "*e")
  , ('ζ', "*z")
  , ('η', "*y")
  , ('θ', "*h")
  , ('ι', "*i")
  , ('κ', "*k")
  , ('λ', "*l")
  , ('μ', "*m")
  , ('ν', "*n")
  , ('ξ', "*c")
  , ('ο', "*o")
  , ('π', "*p")
  , ('ρ', "*r")
  , ('ς', "ts")
  , ('σ', "*s")
  , ('τ', "*t")
  , ('υ', "*u")
  , ('ϕ', "*f")
  , ('χ', "*x")
  , ('ψ', "*q")
  , ('ω', "*w")
  , ('ϑ', "+h")
  , ('φ', "+f")
  , ('ϖ', "+p")
  , ('ϵ', "+e")
  , ('♣', "CL")
  , ('♠', "SP")
  , ('♥', "HE")
  , ('♦', "DI")
  ]

-- use like: \\[E a^ aa]
combiningAccents :: [(Char, String)]
combiningAccents =
  [ ('˝' , "a\"")
  , ('¯', "a-")
  , ('˙', "a.")
  , ('^', "a^")
  , ('´', "aa")
  , ('`', "ga")
  , ('˘', "ab")
  , ('¸', "ac")
  , ('¨', "ad")
  , ('ˇ', "ah")
  , ('˚', "ao")
  , ('~', "a~")
  , ('˛', "ho")
  , ('^', "ha")
  , ('~', "ti")
  ]
