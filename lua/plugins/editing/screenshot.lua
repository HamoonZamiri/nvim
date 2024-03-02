return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    opts = {
      -- Configuration here, or leave empty to use defaults
      font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
      theme = "Dracula",
      to_clipboard = true,
      background = "#94e2d5",
    },
    init = function()
      vim.keymap.set(
        "v",
        "<leader>cs",
        ":'<,'>Silicon<cr>",
        { noremap = true, silent = true, desc = "Code Screenshot Copy" }
      )
    end,
  },
}
