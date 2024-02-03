return {
  {
    "catppuccin",
    opts = {
      flavour = "macchiato",
    },
  },

  {
    "Mofiqul/vscode.nvim",
    opts = {
      italic_comments = false,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },

  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      -- only set this configs for vscode theme
      if vim.g.colors_name == "vscode" then
        vim.list_extend(opts.options, {
          close_icon = "",
          buffer_close_icon = "",
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
        if opts.highlights == nil then
          opts.highlights = {}
        end
        vim.list_extend(opts.highlights, {
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
        })
      end
      return opts
    end,
  },
}
