return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    main = "nvim-silicon",
    opts = {
      -- Configuration here, or leave empty to use defaults
      theme = "Dracula",
      to_clipboard = true,
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
