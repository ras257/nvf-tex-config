local helpers = require("luasnip-helpers")
local in_mathzone = helpers.in_mathzone
local in_text = helpers.in_text
local in_item_list = helpers.in_item_list
local get_visual = helpers.get_visual local is_start_of_line = helpers.is_start_of_line local generate_matrix = helpers.generate_matrix
local map = helpers.map;

local function directly_in_proofcases_and_newline(line_to_cursor, matched_trigger)
  return helpers.get_environment() == "proofcases" and is_start_of_line(line_to_cursor, matched_trigger)
end

local function in_cases()
  return helpers.in_env("cases")
end

local function in_align()
  return helpers.in_env("align")
end

local function in_proof_and_newline(line_to_cursor, matched_trigger)
  return helpers.in_env("proof") and helpers.is_start_of_line(line_to_cursor, matched_trigger)
end

local function in_item_list_and_newline(line_to_cursor, matched_trigger)
  return in_item_list() and is_start_of_line(line_to_cursor, matched_trigger)
end

local function get_environment_choices()
  local environments = vim.fn['vimtex#env#get_all']()
  local nodes = map(environments, function (env)
    return t(env.name)
  end)
  return sn(nil, c(1, nodes))
end

local function get_environment()
  return sn(nil, i(1, vim.fn['vimtex#env#get_inner']().name))
end

local function get_label_choices()
  local labels = {}
  local pattern = "\\label[%a%[%]]*{(.+)}"
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  for _, line in ipairs(lines) do
    for label in line:gmatch(pattern) do
      table.insert(labels, i(1, label))
    end
  end

  if #labels == 0 then
    return sn(nil, { i(1) })
  else
    return sn(nil, { c(1, labels) })
  end
end

local texEnvironments = {
  { trig = "nn", name = "equation", condition = in_text },
  { trig = "aa", name = "align*", condition = in_text },
  { trig = "cc", name = "proofcases", condition = in_text },
  { trig = "ee", name = "enumerate", condition = in_text },
  { trig = "ii", name = "itemize", condition = in_text },
  { trig = "oo", name = "proof", condition = in_text },
  { trig = "pp", name = "proposition", condition = in_text },
  { trig = "xx", name = "example", condition = in_text },
  { trig = "ll", name = "lemma", condition = in_text },
  { trig = "dd", name = "definition", condition = in_text },
  { trig = "tt", name = "theorem", condition = in_text },
  { trig = "rr", name = "remark", condition = in_text },
}

return {
  s(
    { trig = "env" },
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}
      ]],
      { i(1), i(2), rep(1) }
    )
  ),

  s(
    { trig = "dd", snippetType = "autosnippet", condition = in_proof_and_newline, priority = 1001 },
    fmta(
      [[
        \begin{proofdirection}{Assume <>}
          <>
        \end{proofdirection}
      ]],
      { i(1), i(2) }
    )
  ),

  s({ trig = "mm", snippetType = "autosnippet", condition = in_text },
    fmta(
      "$<>$",
      { d(1, get_visual) }
    )
  ),

  s(
    { trig = "\\[", wordTrig = false, snippetType = "autosnippet", priority = 1001 },
    fmta(
      [[
        \[
          <>
        \]
      ]],
      { d(1, get_visual) }
    )
  ),

  s(
    { trig = "\\\\", snippetType = "autosnippet", condition = in_item_list_and_newline },
    { t("\\item") }
  ),

  s(
    { trig = "\\\\", snippetType = "autosnippet", condition = directly_in_proofcases_and_newline },
    fmta(
      [[
        \begin{case}{$<>$}
          <>
        \end{case}
      ]],
      { i(1), i(2) }
    )
  ),

  s(
    { trig = "case(%d+)", regTrig = true, condition = in_mathzone },
    fmta(
      [[
        \begin{cases}
        <>
        \end{cases}
      ]],
      { d(1, function(_, snip) return generate_matrix(tonumber(snip.captures[1]), 2, false) end) }
    )
  ),

  s(
    { trig = "lbb", snippetType = "autosnippet" },
    { c(1, { 
        sn(nil, fmta("\\label{<>}", { i(1) })),
        sn(nil, fmta("\\label[<>]{<>}", { d(1, get_environment), i(2) })),
      })
    }
  ),

  s(
    { trig = "rff", snippetType = "autosnippet", condition = in_text },
    fmta(
      "\\cref{<>}",
      { d(1, get_label_choices) }
    )
  ),

  s(
    { trig = "fmm", snippetType = "autosnippet", condition = in_text },
    { t("\\footnotemark") }
  ),

  s(
    { trig = "ftt", snippetType = "autosnippet", condition = in_text },
    fmta(
      "\\footnotetext{<>}",
      { i(1) }
    )
  ),

  s(
    { trig = "sec", snippetType = "autosnippet", condition = is_start_of_line },
    fmta(
      "\\section{<>}",
      { i(1) }
    )
  ),

  s(
    { trig = "ssec", snippetType = "autosnippet", condition = is_start_of_line, priority = 1001 },
    fmta(
      "\\subsection{<>}",
      { i(1) }
    )
  ),

  s(
    { trig = "sssec", snippetType = "autosnippet", condition = is_start_of_line, priority = 1002 },
    fmta(
      "\\subsubsection{<>}",
      { i(1) }
    )
  ),

  s({ trig = "newchap", snippetType = "autosnippet", condition = is_start_of_line },
    fmta([[
          \documentclass[../main.tex]{subfiles}
          \begin{document}
          \chapter{<>}
          <>
          \end{document}
        ]],
      { i(1), i(0) }
    )
  ),

  s({ trig = "ind", snippetType = "autosnippet", condition = is_start_of_line },
    fmta([[
        \induction
        {$<>$}{
          <>
        }
        {$<>$}{<>}
        {$<>$}{
          <>
        }
      ]],
      { i(1, "n = 1"), i(2), i(3, "n = k"), i(4), i(5, "n = k + 1"), i(6) }
    )
  ),

  unpack(map(texEnvironments, function(env)
    return s(
      { trig = env.trig, snippetType = "autosnippet", condition = env.condition },
      fmta(
        [[
          \begin{<>}<>
            <>
          \end{<>}
        ]],
        { t(env.name),
          c(1, {
            t(""),
            sn(nil, { t("["), i(1), t("]") }),
          }),
          i(2),
          t(env.name)
        }
      )
    )
  end)),
}
