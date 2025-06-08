return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      qwen = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "qwen",
          schema = {
            model = {
              default = "qwen-coder-32768",
            },
            num_ctx = {
              default = 16384,
            },
          },
          -- Enable streaming in all strategies
          opts = {
            stream = true,
          },
        })
      end,
    },
    completion_provider = "blink", -- blink|cmp|coc|default
    strategies = {
      chat = { adapter = "qwen" },
      inline = { adapter = "qwen" },
      action = { adapter = "qwen" },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
