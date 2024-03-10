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
              cabalFormattingProvider = "hlint",
              formattingProvider = "hlint",
            },
          },
        },
      },
      setup = {
        hls = function()
          return true
        end,
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "fourmolu", "haskell-language-server" })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        haskell = { "fourmolu" },
      },
      formatters = {
        fourmolu = {
          -- https://fourmolu.github.io/config/
          prepend_args = {
            "--comma-style=trailing",
            "--haddock-style-module=single-line",
            "--haddock-style=single-line",
          },
        },
      },
    },
  },

  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = {
      { "nvim-telescope/telescope.nvim", optional = true },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("ht")
      end
    end,
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "haskell-debug-adapter" })
        end,
      },
    },
  },

  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      { "mrcjkb/neotest-haskell" },
    },
    opts = {
      adapters = {
        ["neotest-haskell"] = {},
      },
    },
  },

  {
    "mrcjkb/haskell-snippets.nvim",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = { "L3MON4D3/LuaSnip" },
    config = function()
      local haskell_snippets = require("haskell-snippets").all
      require("luasnip").add_snippets("haskell", haskell_snippets, { key = "haskell" })
    end,
  },

  {
    "luc-tielen/telescope_hoogle",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("hoogle")
      end
    end,
  },
}
