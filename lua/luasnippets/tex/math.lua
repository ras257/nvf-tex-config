local helpers = require('luasnip-helpers')
local cap = helpers.cap
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
return {
  s({ trig = "([^%a])ff", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>\\frac{<>}{<>}",
      { cap(1), i(1), i(2) }
    )
  ),

  s({ trig = "lim", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\lim_{<> \\to <>} <>",
      { i(1), i(2, "0"), i(3) }
    )
  ),

  s({ trig = helpers.letter_or_delim .. "00", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>_{<>}",
      { cap(1), t("0") }
    )
  ),

  s({ trig = helpers.letter_or_delim .. "11", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>^{<>}",
      { cap(1), t("-1") }
    )
  ),

  s({ trig = helpers.letter_or_delim .. "([2-9])%2", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>^<>",
      { cap(1), cap(2) }
    )
  ),

  s({ trig = helpers.letter_or_delim .. "%*%*", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>^{<>}",
      { cap(1), t("*") }
    )
  ),

  s({ trig = helpers.letter_or_delim .. "TT", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>^{<>}",
      { cap(1), t("\\trans") }
    )
  ),

  s({ trig = helpers.letter_or_delim_or_digit .. "\"", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>^{<>}",
      { cap(1), i(1) }
    )
  ),

  s({ trig = helpers.letter_or_delim_or_digit .. "tp", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>^{(<>)}",
      { cap(1), i(1) }
    )
  ),

  s({ trig = helpers.letter_or_delim .. "__", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>^{<>}_{<>}",
      { cap(1), i(1), i(2) }
    )
  ),

  s({ trig = helpers.letter_or_delim .. "sb", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>_{<>}",
      { cap(1), i(1) }
    )
  ),

  -- Suffix notation
  s({ trig = helpers.letter_or_delim .. "sx", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "<>_{<> <>}",
      { cap(1), i(1), i(2) }
    )
  ),

  s({ trig = "ee", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "e^{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "sq", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\sqrt{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "bnn", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\binom{<>}{<>}",
      { i(1), i(2) }
    )
  ),

  s({ trig = "ll", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\log_{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "lnn", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    { t("\\ln ") }
  ),

  s({ trig = "exp", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\exp(<>)",
      { i(1) }
    )
  ),
  
  s({ trig = "det", wordTrig = true, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\det(<>)",
      { i(1) }
    )
  ),
  
  s({ trig = "ker", wordTrig = true, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\ker(<>)",
      { i(1) }
    )
  ),

  s({ trig = "pss", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\powerset{<>}",
      { i(1) }
    )
  ),

  s({ trig = "caa", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\cancel{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "ctt", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\cancelto{<>}{<>}",
      { i(1), d(2, get_visual) }
    )
  ),

  s({ trig = "gcd", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\gcd(<>, <>)",
      { i(1, "a"), i(2, "b") }
    )
  ),

  s({ trig = "hcf", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\hcf(<>, <>)",
      { i(1, "a"), i(2, "b") }
    )
  ),

  s({ trig = "abs", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\abs{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "floor", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\floor{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "ceil", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\ceil{<>}",
      { d(1, get_visual) }
    )
  ),

  s({ trig = "Re", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\Re(<>)",
      { i(1, "z") }
    )
  ),

  s({ trig = "Im", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\Im(<>)",
      { i(1, "z") }
    )
  ),

  s({ trig = "kdd", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\delta_{<> <>}",
      { i(1, "i"), i(2, "j") }
    )
  ),

  s({ trig = helpers.not_letter .. "(p?)dv(%a)(%a?)(%d?)", regTrig = true, wordTrig = false, condition = in_mathzone },
    { cap(1), f(function(_, snip) 
      local result = "\\" .. snip.captures[2] .. "deriv"
      if snip.captures[5] ~= "" then
        result = result .. "[" .. snip.captures[5] .. "]"
      end
      if snip.captures[4] == "" then
        result = result .. "{}{" .. snip.captures[3] .. "}"
      else
        result = result .. "{" .. snip.captures[3] .. "}{" .. snip.captures[4] .. "}"
      end
      return result
    end)}
  ),

  s({ trig = "at", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\at{<>}{<>}",
      { i(1), i(2) }
    )
  ),
  
  -- Indefinite Integral
  s({ trig = "ii", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\int <> \\d{<>}",
      { i(1), i(2, "x") }
    )
  ),

  -- Definite Integral
  s({ trig = "id", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\int_{<>}^{<>} <> \\d{<>}",
      { i(1), i(2), i(3), i(4, "x") }
    )
  ),

  -- Definite Integral
  s({ trig = "ioo", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\int_{-\\infty}^{\\infty} <> \\d{<>}",
      { i(1), i(2, "x") }
    )
  ),

  s({ trig = "ev", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\eval{<>}{<>}{<>}",
      { i(1), i(2), i(3) }
    )
  ),

  -- Sum
  s({ trig = "ss", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\sum_{<>}<>",
      { i(1, "n=0"), c(2, { sn(nil, fmta("^{<>} <>", { i(1, "\\infty"), i(2) })), sn(nil, { t(" "), i(1) }) }) }
    )
  ),

  -- Product
  s({ trig = "pp", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\prod_{<>}<>",
      { i(1, "n=0"), c(2, { sn(nil, fmta("^{<>} <>", { i(1, "\\infty"), i(2) })), sn(nil, { t(" "), i(1) }) }) }
    )
  ),

  s({ trig = "CUP", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\bigcup_{<>}<>",
      { i(1, "n=0"), c(2, { sn(nil, fmta("^{<>} <>", { i(1, "\\infty"), i(2) })), sn(nil, { t(" "), i(1) }) }) }
    )
  ),
  
  s({ trig = "CAP", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\bigcap_{<>}<>",
      { i(1, "n=0"), c(2, { sn(nil, fmta("^{<>} <>", { i(1, "\\infty"), i(2) })), sn(nil, { t(" "), i(1) }) }) }
    )
  ),

  s({ trig = "vv", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\vec{<>}",
      { i(1) }
    )
  ),

  s({ trig = "hh", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\hat{<>}",
      { i(1) }
    )
  ),

  postfix({ trig = "vv", match_pattern = "[%a0]$", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    { l("\\vec{" .. l.POSTFIX_MATCH .. "}") }
  ),
  postfix({ trig = "uvv", match_pattern = "[%a]$", priority = 1001, regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    { l("\\uvec{" .. l.POSTFIX_MATCH .. "}") }
  ),
  postfix({ trig = "hh", match_pattern = "[%a]$", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    { l("\\hat{" .. l.POSTFIX_MATCH .. "}") }
  ),

  postfix({ trig = "dt", match_pattern = "[%a]$", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    { l("\\dot{" .. l.POSTFIX_MATCH .. "}") }
  ),

  postfix({ trig = "ddt", match_pattern = "[%a]$", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone, priority = 1001 },
    { l("\\ddot{" .. l.POSTFIX_MATCH .. "}") }
  ),

  postfix({ trig = "dddt", match_pattern = "[%a]$", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone, priority = 1002},
    { l("\\dddot{" .. l.POSTFIX_MATCH .. "}") }
  ),

  postfix({ trig = "ddddt", match_pattern = "[%a]$", regTrig = true, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone, priority = 1003 },
    { l("\\ddddot{" .. l.POSTFIX_MATCH .. "}") }
  ),
}
