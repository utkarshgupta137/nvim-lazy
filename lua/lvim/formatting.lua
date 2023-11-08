return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cc", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
  },
  opts = {
    -- Map of filetype to formatters
    formatters_by_ft = {
      rust = {},
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "dprint" },
    },
  },
}
