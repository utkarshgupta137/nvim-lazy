return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cc", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
  },
  opts = {
    -- Map of filetype to formatters
    formatters_by_ft = {
      nix = {},
      rust = {},
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "dprint" },
    },
    -- Custom formatters and changes to built-in formatters
    formatters = {
      shfmt = {
        -- The base args are { "-filename", "$FILENAME" } so the final args will be
        -- { "-i", "2", "-filename", "$FILENAME" }
        prepend_args = { "-i", "2" },
      },
    },
  },
}
