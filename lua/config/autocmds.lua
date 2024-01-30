-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local autocmds = vim.api.nvim_create_autocmd
augroup("discontinue_comments", { clear = true })
autocmds("FileType", {
  pattern = { "*" },
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - "o"
  end,
  group = "discontinue_comments",
  desc = "Don't continue comments with o/O",
})

autocmds("FileType", {
  pattern = { "tex", "markdown" },
  callback = function()
    vim.opt.wrap = true
    vim.opt.linebreak = true
  end,
  desc = "Toggle word wrap for Latex and Markdown files",
})

autocmds("VimEnter", {
  desc = "Auto select virtualenv Nvim open",
  pattern = "*",
  callback = function()
    local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
    if venv ~= "" then
      require("venv-selector").retrieve_from_cache()
    end
  end,
  once = true,
})

autocmds("FileType", {
  desc = "Auto select virtualenv when opening a python file",
  pattern = { "python" },
  callback = function()
    require("venv-selector").retrieve_from_cache()
  end,
})

autocmds("FileType", {
  desc = "Set indent to 4 spaces for kt files",
  pattern = { "kt" },
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "kotlin",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "racket",
  callback = function()
    vim.bo.commentstring = "; %s"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex,markdown",
  callback = function()
    require("mini.pairs").map_buf(
      0,
      "i",
      "$",
      { action = "closeopen", pair = "$$", neigh_pattern = "[^\\].", register = { cr = false } }
    )
  end,
})

--[[Autosave functionality for Markdown files]]
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2
    ---@diagnostic disable-next-line: inject-field
    vim.b.autosave = true
  end,
})

local function autosave()
  if vim.b.autosave then
    if vim.b.autoformat then
      ---@diagnostic disable-next-line: inject-field
      vim.b.autoformat = false -- Obviously if autosave is on, autoformat should be off
    end
    vim.cmd("silent! write")
  end
end

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
  pattern = "*.md",
  callback = autosave,
})
