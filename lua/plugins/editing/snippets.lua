return {
  -- Disable some friendly-snippets from LazyVim
  {
    "garymjr/nvim-snippets",
    opts = {
      friendly_snippets = true,
      global_snippets = {}, -- Disable the "all" default which gives useless snippets
    },
    dependencies = { "rafamadriz/friendly-snippets" },
  },
}
