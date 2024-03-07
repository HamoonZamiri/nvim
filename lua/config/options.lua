-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = "rounded",
  },
})

vim.opt.mousescroll = "ver:1,hor:6" -- Default: "ver:3,hor:6"

vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }
