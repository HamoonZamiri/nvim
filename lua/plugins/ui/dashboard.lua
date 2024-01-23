-- Taken from https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/text/neovim.lua
local logo = {
  [[                                                                       ]],
  [[                                                                     ]],
  [[       ████ ██████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      █████████ ███████████████████ ███   ███████████   ]],
  [[     █████████  ███    █████████████ █████ ██████████████   ]],
  [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
  [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
  [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
  [[                                                                       ]],
}

return {
  "nvimdev/dashboard-nvim",
  opts = {
    config = {
      -- set the above logo and format it to be centered on the screen
      header = vim.split(string.rep("\n", 8) .. table.concat(logo, "\n") .. "\n\n", "\n"),
    },
  },
}
