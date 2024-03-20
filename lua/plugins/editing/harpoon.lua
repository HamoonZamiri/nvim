return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    },
    keys = {
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon quick menu",
      },
      {
        "<leader>a",
        function()
          local harpoon = require("harpoon")
          harpoon:list():append()
        end,
        desc = "Harpoon append",
      },
      {
        "<leader>1",
        function()
          local cur_win = vim.api.nvim_get_current_win()
          -- If the current window is a diff window, set the mapping to run diffget instead
          if vim.api.nvim_win_get_option(cur_win, "diff") then
            vim.cmd(":diffget 1")
          else
            require("harpoon"):list():select(1)
          end
        end,
      },
      {
        "<leader>2",
        function()
          local cur_win = vim.api.nvim_get_current_win()
          -- If the current window is a diff window, set the mapping to run diffget instead
          if vim.api.nvim_win_get_option(cur_win, "diff") then
            vim.cmd(":diffget 2")
          else
            require("harpoon"):list():select(2)
          end
        end,
      },
      {
        "<leader>3",
        function()
          local cur_win = vim.api.nvim_get_current_win()
          -- If the current window is a diff window, set the mapping to run diffget instead
          if vim.api.nvim_win_get_option(cur_win, "diff") then
            vim.cmd(":diffget 3")
          else
            require("harpoon"):list():select(3)
          end
        end,
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
      },
    },
  },
}
