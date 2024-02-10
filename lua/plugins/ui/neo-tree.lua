return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      enable_normal_mode_for_inputs = true,
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

              os.execute("open " .. string.format("'%s'", filepath))
            end,
            desc = "open_with_system_defaults",
          },
          ["K"] = "show_file_details",
        },
      },
    },
  },

  {
    "folke/edgy.nvim",
    opts = {
      -- Only neo-tree in edgy view
      left = {
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          pinned = true,
          open = function()
            vim.api.nvim_input("<esc><space>e")
          end,
          size = { height = 0.5 },
        },
      },
      animate = { enabled = false },
    },
  },
}
