return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[1][1] = "<leader>li"
      keys[2][2] = "<cmd>Telescope lsp_definitions fname_width=64<cr>"
      keys[3][2] = "<cmd>Telescope lsp_references fname_width=64<cr>"
      keys[5][2] = "<cmd>Telescope lsp_implementations fname_width=64<cr>"
      keys[6][2] = "<cmd>Telescope lsp_type_definitions fname_width=64<cr>"
      keys[#keys - 2][1] = "<leader>la"
      keys[#keys - 1][1] = "<leader>lA"
      keys[#keys - 0][1] = "<leader>lr"
      keys[#keys + 1] = {
        "<leader>lq",
        function() vim.lsp.buf.code_action({ context = { only = { "quickfix" } }, apply = true }) end,
        desc = "QuickFix Code Action",
      }
      keys[#keys + 1] = { "<leader>ln", "<cmd>ConformInfo<cr>", desc = "Confirm Info" }
    end,
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        pyright = {
          settings = {
            python = {
              pythonPath = vim.g.python3_host_prog,
            },
          },
        },
        rnix = {},
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
    keys = {
      { "<leader>cm", false },
      { "<leader>nm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- null-ls
        "actionlint",
        "dprint",
        "isort",
        "shellcheck",
        "shellharden",

        -- nvim-dap
        "bash-debug-adapter",
      })
    end,
  },
}
