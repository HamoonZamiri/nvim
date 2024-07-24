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

vim.g.root_spec = { "cwd", { ".git", "lua" }, "lsp" }
-- Add the following options to make tailwind classes more visually appealing
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.keymap.set("i", "<m-bs>", "<c-w>", { noremap = true, silent = true })
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

vim.opt.clipboard = "unnamedplus"

-- Copy from neovim https://github.com/neovim/neovim/blob/359763307546ae7a401e9458fefeb6f4cd37a40f/runtime/lua/vim/shared.lua#L982
local function validate(name, value, validator, optional, message)
  local err_msg --- @type string?
  if validator then -- Form 1
    -- Check validator as a string first to optimize the common case.
    local ok = (type(value) == validator) or (value == nil and optional == true)
    if not ok then
      local msg = type(optional) == "string" and optional or message --[[@as string?]]
      -- Check more complicated validators
      err_msg = is_valid(name, value, validator, msg, false)
    end
  elseif type(name) == "table" then -- Form 2
    vim.deprecate("vim.validate", "vim.validate(name, value, validator, optional_or_msg)", "1.0")
    err_msg = validate_spec(name)
  else
    error("invalid arguments")
  end

  if err_msg then
    error(err_msg, 2)
  end
end

-- Copy vim.ui.open from latest neovim https://github.com/neovim/neovim/blob/359763307546ae7a401e9458fefeb6f4cd37a40f/runtime/lua/vim/ui.lua#L136
vim.ui.open = function(path, opt)
  validate("path", path, "string")
  local is_uri = path:match("%w+:")
  if not is_uri then
    path = vim.fs.normalize(path)
  end

  opt = opt or {}
  local cmd ---@type string[]
  local job_opt = { text = true, detach = true } --- @type vim.SystemOpts

  if opt.cmd then
    cmd = vim.list_extend(opt.cmd --[[@as string[] ]], { path })
  elseif vim.fn.executable("lemonade") == 1 then
    cmd = { "lemonade", "open", path }
  elseif vim.fn.has("mac") == 1 then
    cmd = { "open", path }
  elseif vim.fn.has("win32") == 1 then
    if vim.fn.executable("rundll32") == 1 then
      cmd = { "rundll32", "url.dll,FileProtocolHandler", path }
    else
      return nil, "vim.ui.open: rundll32 not found"
    end
  elseif vim.fn.executable("xdg-open") == 1 then
    cmd = { "xdg-open", path }
    job_opt.stdout = false
    job_opt.stderr = false
  elseif vim.fn.executable("wslview") == 1 then
    cmd = { "wslview", path }
  elseif vim.fn.executable("explorer.exe") == 1 then
    cmd = { "explorer.exe", path }
  else
    return nil, "vim.ui.open: no handler found (tried: wslview, explorer.exe, xdg-open, lemonade)"
  end

  return vim.system(cmd, job_opt), nil
end
