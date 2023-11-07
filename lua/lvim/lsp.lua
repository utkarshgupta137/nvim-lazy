return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[1][1] = "<leader>ld"
      keys[2][1] = "<leader>li"
      keys[3][2] = "<cmd>Telescope lsp_definitions fname_width=64<cr>"
      keys[4][2] = "<cmd>Telescope lsp_references fname_width=64<cr>"
      keys[6][2] = "<cmd>Telescope lsp_implementations fname_width=64<cr>"
      keys[7][2] = "<cmd>Telescope lsp_type_definitions fname_width=64<cr>"
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
    dependencies = { "MunifTanjim/rust-tools.nvim", branch = "patched" },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        marksman = {},
        pyright = {
          settings = {
            python = {
              pythonPath = vim.g.python3_host_prog,
            },
          },
        },
        rnix = {},
        ruff_lsp = {},
        rust_analyzer = {},
        taplo = {},
        yamlls = {},
      },
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        rust_analyzer = require("lvim.lsp.rust-tools"),
        taplo = require("lvim.lsp.taplo"),
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
        "black",
        "dprint",
        "isort",
        "shellcheck",
        "shellharden",

        -- nvim-dap
        "bash-debug-adapter",
        "codelldb",
        "debugpy",
      })
    end,
  },
}
