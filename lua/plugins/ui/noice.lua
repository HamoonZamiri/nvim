return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        hover = {
          -- If hover is not available don't show message
          -- Useful in TypeScript
          silent = true,
        },
      },
    },
  },
}
