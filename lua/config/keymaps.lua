-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local function disable(mode, key)
  vim.api.nvim_set_keymap(mode, key, "<Nop>", { noremap = true, silent = true })
end

disable("n", "<leader>l") -- open Lazy
disable("n", "<leader>cm") -- open Mason
disable("n", "<leader>cl") -- LspInfo
disable("n", "<leader>L") -- LazyVim changelog
disable("i", "<C-j>") -- default: move down in insert mode, redefined below

-- Remap arrow keys to print message to use hjkl
map("n", "<Up>", function()
  vim.notify("Use `k` instead up `Up Arrow`", "warn")
end, { desc = "Disable <Up> to use k instead" })
map("n", "<Down>", function()
  vim.notify("Use `j` instead up `Down Arrow`", "warn")
end, { desc = "Disable <Down> to use j instead" })
map("n", "<Left>", function()
  vim.notify("Use `h` instead of `Left Arrow`", "warn")
end, { desc = "Disable <Left> to use h instead" })
map("n", "<Right>", function()
  vim.notify("Use `l` instead of `Right Arrow`", "warn")
end, { desc = "Disable <Right> to use l instead" })

--[[ General Mappings ]]
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down", silent = true })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })

-- https://github.com/NvChad/NvChad/blob/8aec881517ae9e39990507f3bc7dfebfb38d531a/lua/core/mappings.lua#L73
-- map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Paste without copying" })
map("x", "p", "pgv=gvy", { desc = "Paste without copying" })

-- Make :Q act like :q and :Qa act like :qa
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Qa", "qa", {})

vim.api.nvim_create_user_command("CodeiumChat", function()
  return vim.fn["codeium#Chat"]()
end, {})

--[[ Floating Terminal ]]
local Util = require("lazyvim.util")

local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root(), border = "rounded" })
end
map("n", "<M-;>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<C-;>", lazyterm, { desc = "Terminal (root dir)" })
map("t", "<C-;>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- mapping to allow option backspace to act as ctrl w
vim.keymap.set("i", "<m-bs>", "<c-w>", { noremap = true, silent = true })

-- Update command
vim.api.nvim_create_user_command("Update", function()
  -- Config directory path
  local config_dir = vim.fn.expand("~/.config/nvim")

  -- Run git pull in the Neovim config directory
  local job_id = vim.fn.jobstart({ "git", "-C", config_dir, "pull" }, {
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        vim.notify("Neovim config repo pulled successfully", vim.log.levels.INFO)
      else
        vim.notify("Failed to pull Neovim config repo", vim.log.levels.WARN)
      end
      vim.schedule(function()
        require("lazy.manage").sync({ show = false })
        vim.notify("Plugins synced successfully", vim.log.levels.INFO)
      end)
    end,
  })

  if job_id <= 0 then
    vim.notify("Failed to start git pull job", vim.log.levels.ERROR)
  end
end, {})
