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
    end,
  },
}
