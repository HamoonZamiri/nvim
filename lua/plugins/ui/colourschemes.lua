return {
  {
    "catppuccin",
    opts = {
      flavour = "macchiato",
    },
  },

  {
    "Mofiqul/vscode.nvim",
  },

  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      -- only set this configs for vscode theme
      if vim.g.colors_name == "vscode" then
        -- disable diagnostics to improve the look for now
        -- TODO: remove when https://github.com/Mofiqul/vscode.nvim/issues/168 resolved
        opts.options.dianostics = ""
        opts.options.diagnostics_indicator = false

        opts.options = opts.options or {}
        opts.highlights = opts.highlights or {}
        table.insert(opts.options, {
          indicator = {
            style = "icon",
            icon = " ",
          },
          left_trunc_marker = "",
          modified_icon = "●",
          offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
          right_trunc_marker = "",
          show_close_icon = false,
          show_tab_indicators = true,
        })
        opts.highlights = {
          fill = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLineNC" },
          },
          background = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
          },
          buffer_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
          buffer_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
          separator = {
            fg = { attribute = "bg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
          },
          separator_selected = {
            fg = { attribute = "fg", highlight = "Special" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
          separator_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLineNC" },
          },
          close_button = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
          },
          close_button_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
          close_button_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
        }
      end
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
