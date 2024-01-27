-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = require("lazyvim.util").safe_keymap_set

-- disable
local function disable(mode, key)
  vim.api.nvim_set_keymap(mode, key, "<Nop>", { noremap = true, silent = true })
end

disable("n", "<leader>l") -- open Lazy
disable("n", "<leader>cm") -- open Mason
disable("n", "<leader>cl") -- LspInfo
disable("n", "<leader>L") -- LazyVim changelog
disable("i", "<C-w>") -- delete backwards in insert mode, redefined below

map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- -- floating terminal
local Util = require("lazyvim.util")

local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root(), border = "rounded" })
end
map("n", "…" --[[ Option + ; ]], lazyterm, { desc = "Terminal (root dir)" })
map("t", "…" --[[ Option + ; ]], "<cmd>close<cr>", { desc = "Hide Terminal" })
map("n", "Ú" --[[ Option + Shift + ; ]], lazyterm, { desc = "Terminal (root dir)" })
map("t", "Ú" --[[ Option + Shift + ; ]], "<cmd>close<cr>", { desc = "Hide Terminal" })

-- https://github.com/nvim-telescope/telescope.nvim/issues/964#issuecomment-1517629615
-- Make a workspace symbol search take an input because it's broken with empty string
map("n", "<leader>fS", function()
  vim.ui.input({ prompt = "Workspace symbols: " }, function(query)
    require("telescope.builtin").lsp_workspace_symbols({ query = query })
  end)
end, { desc = "LSP workspace symbols" })

-- git diff mappings
if vim.bo.filetype == "git" or vim.bo.filetype == "diff" then
  map("n", "<leader>1", ":diffget //2<cr>", { desc = "Git diff get 2" })
  map("n", "<leader>2", ":diffget //3<cr>", { desc = "Git diff get 3" })
end

-- When <Tab> is pressed, either accept the autocomplete suggestion, jump to the next snippet placeholder, or just insert a tab
map("i", "<Tab>", function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  elseif require("luasnip").jumpable(1) then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-next", true, false, true), "m", false)
  else
    return vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { desc = "Tab" })

map("i", "<C-w>", require("copilot.suggestion").accept_word, { desc = "Copilot accept single word" })
