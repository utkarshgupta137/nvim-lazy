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
      },
    },
  },

  {
    "folke/neoconf.nvim",
    keys = {
      { "<leader>cn", "<cmd>Neoconf local<cr>", desc = "Neoconf (local)" },
      { "<leader>cN", "<cmd>Neoconf global<cr>", desc = "Neoconf (global)" },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- conform
        "dprint",
        "shellharden",

        -- jsonnet
        "jsonnet-language-server",
        "jsonnetfmt",

        -- nvim-lint
        "actionlint",
      })
    end,
  },
}
