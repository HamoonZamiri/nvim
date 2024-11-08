return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Remove "text" as an autocomplete source
      opts.sources = vim.tbl_filter(function(source)
        return not vim.tbl_contains({ "buffer", "nvim_lsp" }, source.name)
      end, opts.sources)
      table.insert(opts.sources, 1, {
        name = "nvim_lsp",
        entry_filter = function(entry, _)
          return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
        end,
      })

      -- add border around completion window
      opts.window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      }

      -- disable ghost text for autocomplete
      opts.experimental = {
        ghost_text = false,
      }
      return opts
    end,
  },
}
