return {
  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      region_check_events = "InsertEnter",
      delete_check_events = "TextChanged",
    },
    config = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })
    end,
  },
}
