return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        keyword = {
          range = "full",
        },
        menu = {
          border = "rounded",
          draw = {
            -- Show the type of the autocomplete
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          },
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
        ghost_text = {
          -- Disable the preview text for each autocomplete option
          enabled = false,
        },
      },
      sources = {
        transform_items = function(ctx, items)
          -- Remove the "Text" source from lsp autocomplete
          return vim.tbl_filter(function(item)
            return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
          end, items)
        end,
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          snippets = {
            opts = {
              -- Disable the "all" snippets which gives useless stuff like the 'date' snippet
              global_snippets = {},
            },
          },
        },
      },
    },
  },
}
