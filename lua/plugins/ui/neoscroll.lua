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
    opts = {
      pre_hook = function()
        vim.opt.eventignore:append({
          "WinScrolled",
          "CursorMoved",
        })
      end,
      post_hook = function()
        vim.opt.eventignore:remove({
          "WinScrolled",
          "CursorMoved",
        })
      end,
    },
  },
}
