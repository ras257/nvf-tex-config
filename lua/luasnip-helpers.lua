local M = {}
local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node
local f = ls.function_node
local r = ls.restore_node
local t = ls.text_node

-- Useful patterns
-- Matches letter characters or closing delimiters (')' ']' '}' '}')
M.letter_or_delim = "([%a%)%]%}|])"
M.letter_or_delim_or_digit = "([%a%d%)%]%}|])"
-- Matches letter characters
M.only_letters = "([%a])"
-- Matches non-letter characters
M.not_letter = "([^%a])"

-- Only expand snippet if at the beginning of a line, used with `condition = line_begin`
M.line_begin = require("luasnip.extras.expand_conditions").line_begin

-- LS_SELECT_RAW is populated with a visual selection -> returns an insert node with default text set to the selection
-- If it is empty -> returns an empty insert node
function M.get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

-- Applies a function to each element in a list and returns a new list
function M.map(t, func)
  local result = {}
  for i, v in ipairs(t) do
    result[i] = func(v)
  end
  return result
end

-- Returns a function node that gets the nth capturing group of a regex snippet
function M.cap(n)
  return f(function(_, snip) return snip.captures[n] end)
end

function M.is_even_line()
  local line_number = vim.fn['line']('.')
  return line_number % 2 == 0
end

function M.is_start_of_line(line_to_cursor, matched_trigger)
  local trimmed = line_to_cursor:match("^%s*(.*)")
  return trimmed == matched_trigger
end

function M.in_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

function M.in_text()
  return not M.in_mathzone()
end

function M.in_item_list()
  return M.in_env("enumerate") or M.in_env("itemize")
end

function M.in_env(name)
  -- Rerturns row and column of env start position
  local is_inside = vim.fn['vimtex#env#is_inside'](name)
  -- Both 0 if surrounding environment is not found
  return (is_inside[1] ~= 0 or is_inside[2] ~= 0)
end

function M.get_environment()
  return vim.fn['vimtex#env#get_inner']().name
end

-- See https://evesdropper.dev/files/luasnip/choice-dynamic/#example-1-matrix-snippets---regex-dynamic-snippets
function M.generate_matrix(rows, cols, trailing_cr)
  local nodes = {}
  local ins_index = 1
  for j = 1, rows do
    table.insert(nodes, r(ins_index, tostring(j) .. "x1", i(1)))
    ins_index = ins_index + 1
    for k = 2, cols do
      table.insert(nodes, t(" & "))
      table.insert(nodes, r(ins_index, tostring(j) .. "x" .. tostring(k), i(1)))
      ins_index = ins_index + 1
    end
    table.insert(nodes, t({ " \\\\", "" }))
  end
  if trailing_cr then
    nodes[#nodes] = t(" \\\\")
  else
    table.remove(nodes, #nodes)
  end
  return sn(nil, nodes)
end

return M
