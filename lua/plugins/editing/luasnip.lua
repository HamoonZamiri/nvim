return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({
            exclude = { "markdown", "all" },
          })
        end,
      },
    },
    config = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })
      require("luasnip").config.set_config({
        store_selection_keys = "<Tab>",
        enable_autosnippets = true,
      })
    end,
    keys = {
      {
        "<C-l>",
        function()
          require("luasnip").jump(1)
        end,
        mode = { "i", "s" },
      },
      {
        "<C-h>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    -- Disable text completion
    opts = function(_, opts)
      -- local context = require("cmp.config.context")
      -- opts.enabled = function()
      --   return not context.in_treesitter_capture("comment")
      -- end
      opts.sources = vim.tbl_filter(function(source)
        return not vim.tbl_contains({ "buffer", "nvim_lsp" }, source.name)
      end, opts.sources)
      table.insert(opts.sources, 1, {
        name = "nvim_lsp",
        entry_filter = function(entry, _)
          return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
        end,
      })
    end,
  },
}
