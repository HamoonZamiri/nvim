return {
  {
    "dmmulroy/tsc.nvim",
    opts = {
      use_trouble_qflist = true,
      auto_focus_qflist = true,
    },
    cmd = "TSC",
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    opts = {},
    ft = { "typescript", "typescriptreact" },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        vue = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
      },
    },
  },
}
