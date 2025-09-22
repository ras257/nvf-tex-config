local helpers = require("luasnip-helpers")
local in_mathzone = helpers.in_mathzone
local generate_matrix = helpers.generate_matrix

local function get_matrix_type(_, snip)
  if snip.captures[1] == " " then
    return "matrix"
  end
  return snip.captures[1] .. "matrix"
end

local function get_table_dividers(_, snip)
  local sep = " ";
  if snip.captures[1] == "v" then
    sep = "|"
  end
  return string.rep("c", tonumber(snip.captures[3]), sep)
end

return {
  s({ trig = "([%sbBpvV])mat(%d+)x(%d+)", regTrig = true, wordTrig = false, condition = in_mathzone },
    fmta(
      [[
        \begin{<>}
        <>
        \end{<>}
      ]],
    {
      f(get_matrix_type),
      d(1, function(_, snip) return generate_matrix(tonumber(snip.captures[2]), tonumber(snip.captures[3]), true) end),
      f(get_matrix_type),
    })
  ),
  s({ trig = "([%sbBpvV])vec(%d+)", regTrig = true, wordTrig = false, condition = in_mathzone },
    fmta(
      [[
        \begin{<>}
        <>
        \end{<>}
      ]],
    {
      f(get_matrix_type),
      d(1, function(_, snip) return generate_matrix(tonumber(snip.captures[2]), 1, true) end),
      f(get_matrix_type),
    })
  ),

  s({ trig = "(v?)tab(%d+)x(%d+)", regTrig = true, wordTrig = false },
    fmta(
      [[
        \begin{tabular}{<>}
        <>
        \end{tabular}
      ]],
    {
      f(get_table_dividers),
      d(1, function(_, snip) return generate_matrix(tonumber(snip.captures[2]), tonumber(snip.captures[3])) end),
    })
  ),
}
