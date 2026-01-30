local helpers = require("luasnip-helpers")
local cap = helpers.cap
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_text = helpers.in_text

return {
  s(
    { trig = "(", wordTrig = false, snippetType = "autosnippet", priority = 900 },
    { t("("), d(1, get_visual), t(")") }
  ),

  -- Increase priority so that the normal { snippet is not triggered instead
  s(
    { trig = "\\{", wordTrig = false, snippetType = "autosnippet", priority = 1001 },
    { t("\\{"), d(1, get_visual), t("\\}") }
  ),

  s(
    { trig = "{", wordTrig = false, snippetType = "autosnippet" },
    { t("{"), d(1, get_visual), t("}") }
  ),

  s(
    { trig = "[", wordTrig = false, snippetType = "autosnippet" },
    { t("["), d(1, get_visual), t("]") }
  ),

  s(
    { trig = "|", wordTrig = false, snippetType = "autosnippet" },
    { t("|"), d(1, get_visual), t("|") }
  ),

  s(
    { trig = "\\<", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    { t("\\langle "), d(1, get_visual), t(" \\rangle") }
  ),

  s(
    { trig = "lmr", wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      "\\left<> <> \\middle<> <> \\right<>",
      { i(1, "."), i(2), i(3), i(4), rep(1) }
    )
  ),

  s(
    { trig = "\"\"", wordTrig = false, snippetType = "autosnippet" },
    { t("``"), d(1, get_visual), t("''") }
  ),
}

