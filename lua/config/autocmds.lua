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
  -- markdown, latex, and anything with tailwind
  pattern = { "tex", "markdown", "typescript", "typescriptreact", "html" },
  callback = function()
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.breakindent = true

  end,
  desc = "Toggle word wrap for Latex and Markdown files",
})

autocmds("FileType", {
  desc = "Set indent to 4 spaces for certain files",
  pattern = { "kt", "json" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
    vim.bo.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "kotlin",
  callback = function()
    vim.bo.commentstring = "// %s"
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "log" },
  callback = function()
    vim.opt_local.wrap = true
  end,
  desc = "Disable wrapping for log files",
})

--[[Autosave functionality for Markdown files]]
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2
    ---@diagnostic disable-next-line: inject-field
    vim.b.autosave = true
    vim.b.autoformat = false
  end,
})

local function autosave()
  if vim.b.autosave and not vim.g.autosave then
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
