return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "haskell",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        hls = {
          filetypes = { "haskell", "lhaskell", "cabal" },
          settings = {
            haskell = {
              cabalFormattingProvider = "fourmolu",
              formattingProvider = "fourmolu",
            },
          },
        },
      },
    },
  },

  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       haskell = { "fourmolu" },
  --     },
  --   },
  -- },
}
