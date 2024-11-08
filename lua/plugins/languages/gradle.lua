return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "groovy" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gradle_ls = {},
      },
    },
  },
}
