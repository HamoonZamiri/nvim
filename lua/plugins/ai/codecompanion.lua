return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      acp = {
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {
            env = {
              CLAUDE_CODE_OAUTH_TOKEN = "CLAUDE_CODE_OAUTH_TOKEN",
            },
          })
        end,
      },
    },
    completion_provider = "blink", -- blink|cmp|coc|default
    strategies = {
      chat = { adapter = "claude_code" },
      -- inline = { adapter = "acp" },
      action = { adapter = "claude_code" },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
