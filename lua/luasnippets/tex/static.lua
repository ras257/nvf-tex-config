local helpers = require("luasnip-helpers")
local map = helpers.map
local in_mathzone = helpers.in_mathzone
local in_text = helpers.in_text

local staticCharacters = {
  -- Greek Letters
  { trig = ";a", sub = "\\alpha" },
  { trig = ";b", sub = "\\beta" },
  { trig = ";c", sub = "\\chi" },
  { trig = ";d", sub = "\\delta" },
  { trig = ";D", sub = "\\Delta" },
  { trig = ";e", sub = "\\varepsilon" },
  { trig = ";ve", sub = "\\epsilon" },
  { trig = ";F", sub = "\\Phi" },
  { trig = ";f", sub = "\\phi" },
  { trig = ";vf", sub = "\\varphi" },
  { trig = ";G", sub = "\\Gamma" },
  { trig = ";g", sub = "\\gamma" },
  { trig = ";I", sub = "\\Pi" },
  { trig = ";i", sub = "\\pi" },
  { trig = ";j", sub = "\\iota" },
  { trig = ";k", sub = "\\kappa" },
  { trig = ";l", sub = "\\lambda" },
  { trig = ";m", sub = "\\mu" },
  { trig = ";n", sub = "\\nu" },
  { trig = ";o", sub = "\\omega" },
  { trig = ";O", sub = "\\Omega" },
  { trig = ";P", sub = "\\Psi" },
  { trig = ";p", sub = "\\psi" },
  { trig = ";r", sub = "\\rho" },
  { trig = ";s", sub = "\\sigma" },
  { trig = ";T", sub = "\\Theta" },
  { trig = ";t", sub = "\\theta" },
  { trig = ";X", sub = "\\Xi" },
  { trig = ";x", sub = "\\xi" },
  { trig = ";z", sub = "\\zeta" },
  { trig = ";u", sub = "\\tau" },
  -- Other static characters
  { trig = "xx", sub = "\\times" },
  { trig = ";*", sub = "\\star" },
  { trig = ";@", sub = "\\partial" },
  { trig = ";V", sub = "\\nabla" },
  { trig = ";w", sub = "\\wedge" },
  { trig = ";.", sub = "\\cdot" },
  { trig = ";\\", sub = "\\setminus" },
  { trig = ";(", sub = "\\subset" },
  { trig = ";=(", sub = "\\subseteq" },
  { trig = ";)", sub = "\\supset" },
  { trig = ";=)", sub = "\\supseteq" },
  { trig = ";0", sub = "\\emptyset" },
  { trig = ";>", sub = "\\implies" },
  { trig = ";<", sub = "\\lhd" }, -- Normal subgroup
  { trig = "l..", sub = "\\ldots" },
  { trig = "v..", sub = "\\vdots" },
  { trig = "d..", sub = "\\ddots" },
  { trig = "c..", sub = "\\cdots" },
  { trig = "...", sub = "\\cdots" },
  { trig = "<=", sub = "\\leq" },
  { trig = ">=", sub = "\\geq" },
  { trig = ">>", sub = "\\gg" },
  { trig = "<<", sub = "\\ll" },
  { trig = "!>", sub = "\\mapsto" },
  { trig = "->", sub = "\\to" },
  { trig = "==", sub = "\\equiv" },
  { trig = "~=", sub = "\\cong" },
  { trig = "!=", sub = "\\neq" },
  { trig = "~~", sub = "\\approx" },
  { trig = ";~", sub = "\\sim" },
  { trig = "!!", sub = "\\centernot" },
  { trig = "ninn", sub = "\\notin" },
  { trig = "inn", sub = "\\in" },
  { trig = "pll", sub = "\\parallel" },
  { trig = "perp", sub = "\\perp" },
  { trig = ";/", sub = "\\tick" },
  { trig = "XOR", sub = "\\lxor" },
  { trig = "OR", sub = "\\lor" },
  { trig = "AND", sub = "\\land" },
  { trig = "NOT", sub = "\\lnot" },
  -- Special sets
  { trig = "CC", sub = "\\C" },
  { trig = "NN", sub = "\\N" },
  { trig = "RR", sub = "\\R" },
  { trig = "QQ", sub = "\\Q" },
  { trig = "ZZ", sub = "\\Z" },
  { trig = "FF", sub = "\\F" },
}

return {
  -- These have wordTrig = true
  s({ trig = "oo", snippetType = "autosnippet", condition = in_mathzone }, { t("\\infty") }),

  s({ trig = "cc", snippetType = "autosnippet", condition = in_mathzone }, { t("\\circ") }),

  s({ trig = "AA", snippetType = "autosnippet", condition = in_mathzone }, { t("\\forall") }),

  s({ trig = "EE", snippetType = "autosnippet", condition = in_mathzone }, { t("\\exists") }),

  s({ trig = "ker", snippetType = "autosnippet", condition = in_mathzone }, { t("\\ker") }),

  s({ trig = "imm", snippetType = "autosnippet", condition = in_mathzone }, { t("\\im") }),

  s({ trig = "rnn", snippetType = "autosnippet", condition = in_mathzone }, { t("\\rank") }),

  s({ trig = "nll", snippetType = "autosnippet", condition = in_mathzone }, { t("\\nullity") }),

  s({ trig = "dim", snippetType = "autosnippet", condition = in_mathzone }, { t("\\dim") }),

  s({ trig = "div", snippetType = "autosnippet", condition = in_mathzone }, { t("\\mid") }),

  s({ trig = "sym", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Sym") }),

  s({ trig = "isom", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Isom") }),

  s({ trig = "cll", snippetType = "autosnippet", condition = in_mathzone }, { t("\\ccl") }),

  s({ trig = "ndiv", snippetType = "autosnippet", condition = in_mathzone, priority = 1001 }, { t("\\nmid") }),

  s({ trig = "cup", snippetType = "autosnippet", condition = in_mathzone }, { t("\\cup") }),

  s({ trig = "cap", snippetType = "autosnippet", condition = in_mathzone }, { t("\\cap") }),

  s({ trig = "rel", snippetType = "autosnippet", condition = in_mathzone }, { t("\\rel") }),

  s({ trig = "iff", snippetType = "autosnippet", condition = in_mathzone }, { t("\\iff") }),

  s({ trig = "pmm", snippetType = "autosnippet", condition = in_mathzone }, { t("\\pm") }),

  s({ trig = ";;", snippetType = "autosnippet", condition = in_text }, { t("\\par") }),

  s({ trig = ";/", snippetType = "autosnippet", condition = in_text }, { t("\\tick") }),

  s({ trig = "qq", snippetType = "autosnippet" }, { t("\\quad") }),

  unpack(map(staticCharacters, function(char)
    return s(
      { trig = char.trig, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
      { t(char.sub) }
    )
  end)),
}
