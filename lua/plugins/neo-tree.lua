return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      -- Make neo-tree group empty directories like kotlin/com/example
      group_empty_dirs = true,
      scan_mode = "deep",
    },
    window = {
      mappings = {
        ["O"] = {
          command = function(state)
            local filepath = state.tree:get_node().path

            os.execute("open " .. filepath)
          end,
          desc = "open_with_system_defaults",
        },
      },
    },
  },
}
