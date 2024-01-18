return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      -- Make neo-tree group empty directories like kotlin/com/example
      group_empty_dirs = true,
      scan_mode = "deep",
    },
  },
}
