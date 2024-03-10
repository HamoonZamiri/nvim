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
    },
    init = function()
      local harpoon = require("harpoon")

      -- Set Harpoon keymaps for files 1-5
      for i = 1, 3 do
        vim.keymap.set("n", "<leader>" .. i, function()
          local cur_win = vim.api.nvim_get_current_win()
          -- If the current window is a diff window, set the mapping to run diffget instead
          if vim.api.nvim_win_get_option(cur_win, "diff") then
            vim.cmd(":diffget " .. i)
          else
            harpoon:list():select(i)
          end
        end, { desc = "Harpoon " .. i .. " or :diffget " .. i })

        for j = 4, 5 do
          vim.keymap.set("n", "<leader>" .. j, function()
            harpoon:list():select(j)
          end, { desc = "Harpoon " .. j })
        end
      end
    end,
  },
}
