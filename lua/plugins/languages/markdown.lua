local obsidian_vault_dir = "~/Document/Obsidian Vault/"

return {
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      latex = { enabled = false },
      win_options = {
        conceallevel = { rendered = 2 }, -- to disable latex
      },
      file_types = { "markdown", "norg", "rmd", "org" },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      Snacks.toggle({
        name = "Render Markdown",
        get = function()
          return require("render-markdown.state").enabled
        end,
        set = function(enabled)
          local m = require("render-markdown")
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map("<leader>um")
    end,
  },

  -- Obsidian - https://blog.gabedunn.dev/posts/2023-03-09-neovim-config.html#obsidian
  {
    "epwalsh/obsidian.nvim",
    version = false, -- get latest version
    lazy = true,
    ft = "markdown",
    -- Only load obsidian if the vault directory exists
    cond = vim.fn.isdirectory(vim.fn.expand(obsidian_vault_dir)) == 1,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open Obsidian" },
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Create a new Obsidian Document" },
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian" },
      { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian Find Files" },
      { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Obsidian Paste Image" },
      { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Obsidian Rename current note" },
      { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Insert Obsidian Template into file" },
    },

    opts = {
      ui = { enable = false },
      workspaces = {
        {
          name = "Obsidian Vault",
          path = obsidian_vault_dir,
        },
      },
      open_app_foreground = true,
      completion = {
        nvim_cmp = true, -- with this set to true, it automatically configures completion on its own
      },
      disable_frontmatter = true,
      use_advanced_uri = true,
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
      },
      note_id_func = function(title)
        if title ~= nil then
          -- Convert title to lowercase and replace spaces with hyphens, e.g. "My Note" -> "my-note"
          return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          return "untitled"
        end
      end,
    },
  },

  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      if type(opts.spec) == "table" then
        table.insert(opts.spec or {}, { "<leader>o", group = "Obsidian" })
      end
    end,
  },
}
