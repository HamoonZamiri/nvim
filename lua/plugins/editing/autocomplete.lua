-- override default nvim-cmp to add border around the completion window
return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      }
      -- disable ghost text for autocomplete since copilot is using ghost text
      opts.experimental = {
        ghost_text = false,
      }

      return opts
    end,
  },

  -- this is for copilot in autocomplete menu, don't need this since using ghost text
  {
    "zbirenbaum/copilot-cmp",
    enabled = false,
  },

  {
    "L3MON4D3/LuaSnip",
    -- disable the tab key here and enable it in keymaps.lua
    keys = function()
      return {}
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      keymap = {
        -- overriden in keymaps.lua
        accept = false,
        accept_word = false,
        accept_line = false,
        next = false,
        prev = false,
        dismiss = false,
      },
    },
  },
}
