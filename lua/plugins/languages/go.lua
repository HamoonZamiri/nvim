return {

  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        cmd_env = { GOFUMPT_SPLIT_LONG_LINES = "on" },
        gofumpt = true,
      },
    },
  },
}
