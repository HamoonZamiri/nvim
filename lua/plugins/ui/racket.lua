return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "racket",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        racket_langserver = {},
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    ft = { "racket" },
    opts = {
      sources = {
        require("null-ls").builtins.formatting.raco_fmt.with({
          command = "raco",
          args = { "fmt", "--width", "60" },
        }),
      },
    },
  },
}
