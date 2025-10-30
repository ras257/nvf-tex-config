local helpers = require('luasnip-helpers')
local map = helpers.map
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_text = helpers.in_text


local math_text_shorthand = {
  { trig = "ttf", text = "for all" },
  { trig = "tte", text = "there exists" },
  { trig = "tti", text = "if" },
  { trig = "tts", text = "such that" },
  { trig = "tta", text = "and" },
  { trig = "ttt", text = "is true" },
  { trig = "tto", text = "otherwise" },
}
return {
  s({ trig = "tii", snippetType = "autosnippet", condition = in_text },
    fmta(
      "\\textit{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "tbb", snippetType = "autosnippet", condition = in_text },
    fmta(
      "\\textbf{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "tee", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\text{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "mcc", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\mathcal{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "mbb", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\mathbf{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "mee", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\EuScript{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "mrr", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\mathrm{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "obb", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\overbrace{<>}^{<>}",
      { d(1, get_visual), i(2) }
    )
  ),

  s({ trig = "ubb", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\underbrace{<>}_{<>}",
      { d(1, get_visual), i(2) }
    )
  ),

  s({ trig = "xrr", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\xrightarrow{<>}",
      { d(1, get_visual) }
    )
  ),

  unpack(map(math_text_shorthand, function(shorthand)
    return s(
      { trig = shorthand.trig, snippetType = "autosnippet", condition = in_mathzone },
      { t("\\text{ " .. shorthand.text .. " }") }
    )
  end)),
}
