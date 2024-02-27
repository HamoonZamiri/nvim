-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/
local ls = require("luasnip")
local s = ls.s
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local markdown_helper = require("plugins.languages.helper.markdown-helper")
local in_mathzone = markdown_helper.in_mathzone
local in_text = markdown_helper.in_text

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

-- TODO: Add snippets from here: https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#context-specific-expansion-for-latex

return {
  -- Angle Bracket snippets since fmta doesn't work with them
  s({ trig = "def", name = "Definition callout" }, { t({ "> [!danger] Definition:", "" }), t("> ") }),
  s({ trig = "thm", name = "Theorem callout" }, { t("> [!tip] Theorem "), i(1), t({ ":", "> " }) }),
  s({ trig = "theorem", name = "Theorem callout" }, { t("> [!tip] Theorem "), i(1), t({ ":", "> " }) }),

  -- <div style="page-break-after: always; visibility: hidden">
  -- \pagebreak
  -- </div>
  s(
    { trig = "pagebreak", name = "div pagebreak" },
    { t({ '<div style="page-break-after: always; visibility: hidden">', "\\pagebreak", "</div>" }) }
  ),

  -- fmta snippets
  s(
    { trig = "b", name = "**bold** text" },
    fmta("<visual>**<bold_text>**<finish>", {
      visual = f(function(_, snip)
        return snip.captures[1]
      end),
      bold_text = d(1, get_visual),
      finish = i(0),
    }),
    { show_condition = in_text }
  ),
  s(
    { trig = "i", name = "*italic* text" },
    fmta("<visual>*<italic_text>*<finish>", {
      visual = f(function(_, snip)
        return snip.captures[1]
      end),
      italic_text = d(1, get_visual),
      finish = i(0),
    }),
    { show_condition = in_text }
  ),

  s(
    { trig = "mi", name = "inline math $$" },
    fmta("<visual>$<math>$<finish>", {
      visual = f(function(_, snip)
        return snip.captures[1]
      end),
      math = d(1, get_visual),
      finish = i(0),
    }),
    { show_condition = in_text }
  ),

  s(
    { trig = "mb", name = "block math $$ $$" },
    fmta(
      [[
<visual>
$$
<math>
$$
<finish>
  ]],
      {
        visual = f(function(_, snip)
          return snip.captures[1]
        end),
        math = d(1, get_visual),
        finish = i(0),
      }
    ),
    { show_condition = in_text }
  ),

  s(
    { trig = "cb", name = "code block ```" },
    fmta(
      [[
  ```<language>
  <code>
  ```
  <finish>
  ]],
      { language = i(1), code = i(2), finish = i(0) }
    ),
    { show_condition = in_text }
  ),

  s(
    { trig = "pc", name = "piecewise fun" },
    fmta(
      [[
  $$
  \begin{cases}
    <first> & \text{if } <first_condition> \\
    <second> & \text{if } <second_condition> \\
  \end{cases}
  $$
  <finish>
  ]],
      {
        first = i(1),
        first_condition = i(2),
        second = i(3),
        second_condition = i(4),
        finish = i(0),
      }
    ),
    { show_condition = in_text }
  ),

  s(
    { trig = "aln", name = "aligned math block" },
    fmta(
      [[
  $$
  \begin{align*}
    <equation>
  \end{align*}
  $$
  <finish>
  ]],
      { equation = i(1), finish = i(0) }
    ),
    { show_condition = in_text }
  ),

  s(
    { trig = "ff", name = "Fraction" },
    fmta("<visual>$\\frac{<>}{<>}$", {
      visual = f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
      i(2),
    }),
    {
      show_condition = in_text,
    }
  ),

  -- MATH snippets
  s(
    { trig = "ff", name = "Fraction" },
    fmta("<visual>\\frac{<>}{<>}", {
      visual = f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
      i(2),
    }),
    {
      show_condition = in_mathzone,
    }
  ),

  s("N", { t("\\mathbb{N}") }, { show_condition = in_mathzone }),
}
