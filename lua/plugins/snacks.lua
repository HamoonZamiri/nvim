return {
  "folke/snacks.nvim",
  opts = {

    dashboard = {
      preset = {
        -- Taken from https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/text/neovim.lua
        header = [[                                                                       
                                                                               
                 ████ ██████           █████      ██                     
                ███████████             █████                             
                █████████ ███████████████████ ███   ███████████   
               █████████  ███    █████████████ █████ ██████████████   
              █████████ ██████████ █████████ █████ █████ ████ █████   
            ███████████ ███    ███ █████████ █████ █████ ████ █████  
           ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                                 ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find Files", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "g", desc = "LazyGit", action = ":lua Snacks.lazygit()" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
      },
    },

    indent = {
      enabled = false,
      -- Decrease number of indent lines
      indent = {
        only_scope = true,
        only_current = true,
      },
    },

    input = {
      relative = "cursor",
      row = 0,
      col = 0,
      keys = {
        -- Allow using normal mode in inputs like "Code Rename"
        i_esc = { "<esc>", { "stopinsert" }, mode = "i" },
      },
    },
  },
}
