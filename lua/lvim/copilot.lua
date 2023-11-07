return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      panel = {
        auto_refresh = true,
        keymap = {
          jump_prev = "<M-a>",
          jump_next = "<M-d>",
        },
        layout = {
          position = "right", -- | top | left | right
        },
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept_word = "<M-w>",
          accept_line = "<M-e>",
          prev = "<M-a>",
          next = "<M-d>",
        },
      },
      filetypes = {
        ["*"] = true,
      },
    },
  },

  -- Ref: https://www.lazyvim.org/extras/coding/copilot
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      local Util = require("lazyvim.util")
      local colors = {
        [""] = Util.ui.fg("Special"),
        ["Normal"] = Util.ui.fg("Special"),
        ["Warning"] = Util.ui.fg("DiagnosticError"),
        ["InProgress"] = Util.ui.fg("DiagnosticWarn"),
      }
      table.insert(opts.sections.lualine_x, 2, {
        function()
          local icon = require("lazyvim.config").icons.kinds.Copilot
          local status = require("copilot.api").status.data
          return icon .. (status.message or "")
        end,
        cond = function()
          if not package.loaded["copilot"] then
            return
          end
          local ok, clients = pcall(require("lazyvim.util").lsp.get_clients, { name = "copilot", bufnr = 0 })
          if not ok then
            return false
          end
          return ok and #clients > 0
        end,
        color = function()
          if not package.loaded["copilot"] then
            return
          end
          local status = require("copilot.api").status.data
          return colors[status.status] or colors[""]
        end,
      })
    end,
  },

  -- Ref: https://www.lazyvim.org/configuration/recipes#supertab
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local copilot = require("copilot.suggestion")

      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.select_next_item()
        elseif copilot.is_visible() then
          copilot.accept()
        elseif cmp.visible() then
          cmp.select_next_item({ count = 0 })
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- they way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if cmp.get_active_entry() then
            cmp.select_prev_item()
          else
            cmp.select_next_item({ count = 0 })
          end
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })
    end,
  },
}
