return {
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

  -- Disable friendly-snippets from LazyVim
  {
    "garymjr/nvim-snippets",
    opts = {
      friendly_snippets = true,
      global_snippets = {}, -- Disable the "all" default which gives useless snippets
    },
    dependencies = { "rafamadriz/friendly-snippets" },
  },
}
