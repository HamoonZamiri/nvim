-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/
local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node

local function add_snippet(trigger, snippet)
  return ls.snippet({ trig = trigger }, snippet)
end

return {
  add_snippet("def", { t({ "> [!danger] Definition:", "" }), t("> ") }),
  add_snippet("thm", { t("> [!tip] Theorem "), i(1), t({ ":", "> " }) }),
  add_snippet("theorem", { t("> [!tip] Theorem "), i(1), t({ ":", "> " }) }),
}
