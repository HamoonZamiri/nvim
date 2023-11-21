-- https://github.com/LazyVim/LazyVim/discussions/758
return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local lsp_keys = require("lazyvim.plugins.lsp.keymaps")
      local keys = lsp_keys.get()
      for _, key in ipairs(keys) do
        if key[1] == "K" then
          key[1] = "<nop>"
        end
      end
    end,
  },
}
