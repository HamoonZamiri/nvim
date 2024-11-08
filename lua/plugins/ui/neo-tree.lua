return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "neo_tree_popup_input_ready",
          ---@param args { bufnr: integer, winid: integer }
          handler = function(args)
            -- map <esc> to enter normal mode (by default closes prompt)
            vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })

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
