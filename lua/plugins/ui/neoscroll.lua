return {
  {
    "karb94/neoscroll.nvim",
    keys = {
      { "<C-d>", desc = "Half page down" },
      { "<C-u>", desc = "Half page up" },
      { "<C-b>", desc = "Page up" },
      { "<C-f>", desc = "Page down" },
      { "zt", desc = "Scroll to top" },
      { "zz", desc = "Scroll to center" },
      { "zb", desc = "Scroll to bottom" },
    },
    config = function()
      require("neoscroll").setup()
    end,
  },
}
