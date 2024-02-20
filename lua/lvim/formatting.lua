return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cc", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
  },
  opts = {
    -- Map of filetype to formatters
    formatters_by_ft = {
      ["json"] = { "dprint" },
      ["jsonc"] = { "dprint" },
      ["markdown"] = { "dprint" },
      ["markdown.mdx"] = { "dprint" },
      ["sql"] = { "dprint" },
      ["toml"] = { "dprint" },
      ["yaml"] = { "dprint" },
    },
    -- Custom formatters and changes to built-in formatters
    formatters = {
      shfmt = {
        -- The base args are { "-filename", "$FILENAME" } so the final args will be
        -- { "-i", "2", "-filename", "$FILENAME" }
        prepend_args = { "-s", "-i", "2", "-bn", "-ci" },
      },
    },
  },
}
