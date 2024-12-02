return {
  {
    "telescope.nvim",
    keys = {
      {
        "<leader>fd",
        function()
          require("telescope.builtin").find_files({
            follow = true,
            find_command = {
              "fd",
              "--type",
              "d",
              "--hidden",
              "--exclude",
              ".git",
              "--exclude",
              "node_modules",
              "--exclude",
              "build",
            },
          })
        end,
        desc = "Find directories",
      },
    },
    opts = {
      pickers = {
        find_files = {
          -- Modify the `rg` command to include hidden files but ignore `node_modules` and `.git`
          find_command = {
            "rg",
            "--hidden",
            "--ignore-file",
            vim.fn.expand("~/.gitignore"), -- ignore everything in ~/.gitignore
            "--files",                     -- also ignore node_modules and .git
            "-g",
            "!**/node_modules/*",
            "-g",
            "!**/.git/*",
            "-g",
            "!**/build/*",
            "-g",
            "!**/.*cache/*",
          },
        },
      },
    },
  },
}
