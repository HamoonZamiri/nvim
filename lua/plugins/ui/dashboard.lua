
return {
  {
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
    },
  },
}
