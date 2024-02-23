-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- TODO: Add snippets from here: https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#context-specific-expansion-for-latex

local function add_snippet(trigger, snippet)
  return s({ trig = trigger }, snippet)
end

return {
  add_snippet("def", { t({ "> [!danger] Definition:", "" }), t("> ") }),
  add_snippet("thm", { t("> [!tip] Theorem "), i(1), t({ ":", "> " }) }),
  add_snippet("theorem", { t("> [!tip] Theorem "), i(1), t({ ":", "> " }) }),
  -- <div style="page-break-after: always; visibility: hidden">
  -- \pagebreak
  -- </div>
  add_snippet(
    "pagebreak",
    { t({ '<div style="page-break-after: always; visibility: hidden">', "\\pagebreak", "</div>" }) }
  ),
}
