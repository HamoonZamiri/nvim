return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("harpoon"):setup()
    end,
    init = function()
      local harpoon = require("harpoon")

      vim.keymap.set("n", "<leader>h", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon quick menu" })

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():append()
      end, { desc = "Harpoon append" })

      -- Set Harpoon keymaps for files 1-9
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

        for j = 4, 9 do
          vim.keymap.set("n", "<leader>" .. j, function()
            harpoon:list():select(j)
          end, { desc = "Harpoon " .. j })
        end
      end
    end,
  },
}
