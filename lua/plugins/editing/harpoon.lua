return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = "nvim-lua/plenary.nvim",
    setup = function()
      require("harpoon"):setup()
    end,
  },
}
