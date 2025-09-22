local helpers = require('luasnip-helpers')
local map = helpers.map
local in_mathzone = helpers.in_mathzone

local shorthands = {
  { trig = "'s", sub = "\\sin", default_arg = "x" },
  { trig = "'c", sub = "\\cos", default_arg = "x" },
  { trig = "'t", sub = "\\tan", default_arg = "x" },

  { trig = "'as", sub = "\\arcsin", default_arg = "x" },
  { trig = "'ac", sub = "\\arccos", default_arg = "x" },
  { trig = "'at", sub = "\\arctan", default_arg = "x" },

  { trig = "'o", sub = "\\csc", default_arg = "x" },
  { trig = "'e", sub = "\\sec", default_arg = "x" },
  { trig = "'k", sub = "\\cot", default_arg = "x" },

  { trig = "'hs", sub = "\\sinh", default_arg = "x" },
  { trig = "'hc", sub = "\\cosh", default_arg = "x" },
  { trig = "'ht", sub = "\\tanh", default_arg = "x" },
  { trig = "'has", sub = "\\arsinh", default_arg = "x" },
  { trig = "'hac", sub = "\\arcosh", default_arg = "x" },
  { trig = "'hat", sub = "\\artanh", default_arg = "x" },
}
return {
  unpack(map(shorthands, function(shorthand)
      return s(
        { trig = shorthand.trig, wordTrig = false, snippetType = "autosnippet", condition = in_mathzone },
        { t(shorthand.sub) }
      )
    end
  )),
}
