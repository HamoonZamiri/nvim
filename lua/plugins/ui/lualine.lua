local black_and_not_bold = { fg = "#000000", gui = "none" }
local lsp_progress = {
  "lsp_progress",
  color = black_and_not_bold,
  padding = { left = 0, right = 1 },
  separators = {
    lsp_client_name = { pre = "[", post = "]" },
  },
  display_components = { "lsp_client_name" },
  hide = { "copilot", "tailwindcss", "pyright" },
  only_show_attached = true, -- Show only clients for current buffer
  timer = {
    lsp_client_name_enddelay = -1, -- Make the lsp_client_name stay permanently
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- remove git diff info from lualine_x
      table.remove(opts.sections.lualine_x, 6)

      -- Show word count in visual mode
      table.insert(opts.sections.lualine_y, 1, {
        function()
          if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
            if not (vim.fn.wordcount().visual_words == nil) then
              return tostring(vim.fn.wordcount().visual_words) .. "w"
            else
              -- return tostring(vim.fn.wordcount().words) .. " words" -- Total word count
              return ""
            end
          else
            return ""
          end
        end,
        separator = "",
      })

      opts.sections.lualine_z = {
        {
          "filetype",
          color = black_and_not_bold,
          separator = "",
        },
        lsp_progress,
      }
    end,
  },

  {
    "WhoIsSethDaniel/lualine-lsp-progress.nvim",
  },
}
