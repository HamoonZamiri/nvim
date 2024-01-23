return {
  {
    "Pocco81/auto-save.nvim",

    ft = { "markdown" },

    opts = {
      -- Disable the message
      execution_message = { message = "" },
    },
  },

  -- Remove markdown from formatters so it doesn't format on every auto save
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      opts.formatters_by_ft["markdown"] = {}
      opts.formatters_by_ft["markdown.mdx"] = {}
    end,
  },
}
