return {
  "echasnovski/mini.surround",
  version = false,
  opts = {
    -- Copy mappings from tpope/vim-surround
    mappings = {
      add = "ys", -- Add surrounding in Normal and Visual modes
      delete = "ds", -- Delete surrounding
      find = "fs", -- Find surrounding (to the right)
      find_left = "Fs", -- Find surrounding (to the left)
      highlight = "''", -- Highlight surrounding
      replace = "cs", -- Replace surrounding
      update_n_lines = "''", -- Update `n_lines`
    },
  },
}
