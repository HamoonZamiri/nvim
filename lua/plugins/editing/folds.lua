return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    opts = {
      -- Automatically fold imports based on LSP's
      close_fold_kinds_for_ft = {
        default = { "imports" },
      },
    },
  },
}
