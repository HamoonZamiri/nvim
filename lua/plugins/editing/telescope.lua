return {
  {
    "telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          -- Modify the `rg` command to include hidden files but ignore `node_modules` and `.git`
          find_command = {
            "rg",
            "--hidden",
            "--ignore-file",
            vim.fn.expand("~/.gitignore"), -- ignore everything in ~/.gitignore
            "--files",
            "-g",
            "!**/node_modules/*",
            "-g",
            "!**/.git/*",
          },
        },
      },
    },
  },
}
