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
          color = { fg = "#000000", gui = "none" },
          separator = "",
        },
        function()
          return require("lsp-progress").progress()
        end,
      }
    end,
  },

  {
    "linrongbin16/lsp-progress.nvim",
    opts = {
      client_format = function(client_name, spinner, series_messages)
        if #series_messages == 0 then
          return nil
        end
        return {
          name = client_name,
        }
      end,
      format = function(client_messages)
        --- @param name string
        --- @param msg string?
        --- @return string
        local function stringify(name, msg)
          return msg and string.format("%s %s", name, msg) or name
        end

        local sign = "" -- nf-fa-gear \uf013
        local lsp_clients = require("lsp-progress.api").lsp_clients()
        -- Remove copilot and others
        lsp_clients = vim.tbl_filter(function(cli)
          return not vim.tbl_contains({ "copilot", "tailwindcss", "pyright" }, cli.name)
        end, lsp_clients)

        local messages_map = {}
        for _, climsg in ipairs(client_messages) do
          messages_map[climsg.name] = climsg.body
        end

        if #lsp_clients > 0 then
          local builder = {}
          for _, cli in ipairs(lsp_clients) do
            if type(cli) == "table" and type(cli.name) == "string" and string.len(cli.name) > 0 then
              if messages_map[cli.name] then
                table.insert(builder, stringify(cli.name, messages_map[cli.name]))
              else
                table.insert(builder, stringify(cli.name))
              end
            end
          end
          if #builder > 0 then
            return sign .. " " .. table.concat(builder, ", ")
          end
        end
        return ""
      end,
    },
  },
}
