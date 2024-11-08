return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "smithy" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        smithy_ls = {},
      },
    },
  },
}
