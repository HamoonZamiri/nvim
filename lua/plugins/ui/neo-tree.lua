return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "neo_tree_popup_input_ready",
          ---@param input NuiInput
          handler = function(input)
            -- vim.cmd("exe 'norm T.'") -- Move before the first dot in insert mode
            vim.cmd("exe 'norm ^l'") -- Move to start of line
            vim.cmd("stopinsert") -- Enter normal mode
          end,
        },
      },
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
