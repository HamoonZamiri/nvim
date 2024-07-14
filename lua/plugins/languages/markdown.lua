return {
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
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
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = {
          headline_highlights = {}, -- replace with custom highlights below
          fat_headlines = false, -- iTerm2 doesn't render it properly
          bullets = {}, -- display the default ## instead of the bullet
          bullet_highlights = {},
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end

      return opts
    end,
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)
    end,
  },

  -- Obsidian - https://blog.gabedunn.dev/posts/2023-03-09-neovim-config.html#obsidian
  {
    "epwalsh/obsidian.nvim",
    version = false, -- get latest version
    lazy = true,
    ft = "markdown",
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
      workspaces = {
        {
          name = "Obsidian Vault",
          path = "~/Documents/Obsidian Vault",
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
