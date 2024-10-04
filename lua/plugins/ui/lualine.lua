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
          color = { fg = "#000000", gui = "bold" },
          separator = "",
        },

        -- Add active lsp's to rightmost
        {
          function()
            local clients = vim.lsp.get_clients()
            if #clients == 0 then
              return ""
            end

            local not_included_serevers = { "tailwindcss", "pyright" }
            local client_names = {}
            for _, client in ipairs(clients) do
              if not vim.tbl_contains(not_included_serevers, client.name) then
                table.insert(client_names, client.name)
              end
            end

            if #client_names > 0 then
              return " " .. table.concat(client_names, ", ")
            else
              return ""
            end
          end,
          color = { fg = "#000000", gui = "none" },
        },
      }
    end,
  },
}
