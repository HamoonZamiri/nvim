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
  opts = function(_, opts)
    -- set the above logo and format it to be centered on the screen
    opts.config.header = vim.split(string.rep("\n", 8) .. table.concat(logo, "\n") .. "\n\n", "\n")
    table.remove(opts.config.center, 2) -- Remove "new file"
    table.remove(opts.config.center, 6) -- Remove "lazy extras"

    -- Add lazygit as an option with "g"
    local lazygit_item = opts.config.center[3]
    lazygit_item.action = "lua LazyVim.lazygit()"
    lazygit_item.desc = "  LazyGit"
    lazygit_item.icon = ""

    return opts
  end,
}
