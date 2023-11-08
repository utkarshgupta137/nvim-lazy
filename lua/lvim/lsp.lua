return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[2][2] = "<cmd>Telescope lsp_definitions fname_width=64<cr>"
      keys[3][2] = "<cmd>Telescope lsp_references fname_width=64<cr>"
      keys[5][2] = "<cmd>Telescope lsp_implementations fname_width=64<cr>"
      keys[6][2] = "<cmd>Telescope lsp_type_definitions fname_width=64<cr>"
    end,
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        nil_ls = {},
        pyright = {
          settings = {
            python = {
              pythonPath = vim.g.python3_host_prog,
            },
          },
        },
      },
    },
  },

  {
    "folke/neoconf.nvim",
    keys = {
      { "<leader>nc", "<cmd>Neoconf local<cr>", desc = "Neoconf (local)" },
      { "<leader>nC", "<cmd>Neoconf global<cr>", desc = "Neoconf (global)" },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- conform
        "actionlint",
        "dprint",
        "shellharden",
      })
    end,
  },
}
