-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/
local ls = require("luasnip")
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local markdown_helper = require("plugins.languages.helper.markdown-helper")
local in_mathzone = markdown_helper.in_mathzone
local in_text = markdown_helper.in_text

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
    fmta("**<bold_text>**<finish>", { bold_text = i(1), finish = i(0) }),
    { show_condition = in_text }
  ),
  s(
    { trig = "i", name = "*italic* text" },
    fmta("*<italic_text>*<finish>", { italic_text = i(1), finish = i(0) }),
    { show_condition = in_text }
  ),

  s(
    { trig = "mi", name = "inline math $$" },
    fmta("$<math>$<finish>", { math = i(1), finish = i(0) }),
    { show_condition = in_text }
  ),

  s(
    { trig = "mb", name = "block math $$ $$" },
    fmta(
      [[
$$
<math>
$$
<finish>
  ]],
      { math = i(1), finish = i(0) }
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

  -- MATH snippets
  s(
    { trig = "ff", name = "Fraction" },
    fmta("\\frac{<>}{<>}", {
      i(1),
      i(2),
    }),
    {
      show_condition = in_mathzone,
    }
  ),

  s("N", { t("\\mathbb{N}") }, { show_condition = in_mathzone }),
}
