return {
  -- Replace mini.surround with nvim-surround
  {
    "echasnovski/mini.surround",
    enabled = false,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "LazyFile",
    opts = {
      visual = "",
    },
    init = function()
      vim.keymap.set("v", "s", "<Plug>(nvim-surround-visual)", { desc = "Surround selection" })
    end,
  },
}
