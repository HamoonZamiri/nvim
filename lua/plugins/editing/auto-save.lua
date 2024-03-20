local ENABLE_AUTOSAVE = false -- Set to true to enable autosave

return {
  {
    "okuuva/auto-save.nvim",

    keys = {
      {
        "<leader>ua",
        function()
          vim.cmd("ASToggle")
          require("lazyvim.util").format.toggle()
          vim.g.autosave = not vim.g.autosave
          require("lualine").refresh()
        end,
        desc = "Toggle AutoSave (and autoformat)",
      },
    },

    opts = function(_, opts)
      vim.g.autosave = ENABLE_AUTOSAVE
      opts.enabled = vim.g.autosave
      vim.g.autoformat = not opts.enabled -- set autoformat to the opposite of autosave

      opts.execution_message = { message = "" } -- Disable the default message
    end,
    -- TODO: sync with auto formatter once this is resolved: https://github.com/okuuva/auto-save.nvim/issues/45
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          if vim.g.autosave then
            return ""
          else
            return "󱙃"
          end
        end,

        cond = function()
          return vim.g.autosave
        end,

        color = function()
          if vim.g.autosave then
            return { fg = "#00ff00" } -- Green color when Autosave is ON
          else
            return { fg = "#ff0000" } -- Red color when Autosave is OFF
          end
        end, -- Set color dynamically based on Autosave status
      })
    end,
  },
}
