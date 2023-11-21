-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = require("lazyvim.util").safe_keymap_set

-- disable
map("n", "<leader>l", "<nop>") -- open Lazy
map("n", "<leader>cm", "<nop>") -- open Mason
map("n", "<leader>cl", "<nop>") -- LspInfo
map("n", "<leader>L", "<nop>") -- LazyVim changelog

-- add
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map("n", "<C-C>", "<cmd> %y+ <cr>", { desc = "Copy entire file" })
map("n", "<C-A>", "ggVG", { desc = "Select entire file" })

vim.keymap.set("n", "<C-/>", function()
  require("lazyvim.util").terminal(nil, { border = "rounded" })
end, { desc = "Term with border" })
