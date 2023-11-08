return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cF", false },
    {
      "<leader>lF",
      function() require("conform").format({ formatters = { "injected" } }) end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
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
