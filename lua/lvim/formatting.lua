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
      ["toml"] = { "dprint" },
      ["yaml"] = { "dprint" },
    },
    -- Custom formatters and changes to built-in formatters
    formatters = {
      dprint = {
        -- When inherit = true, add these additional arguments to the command.
        -- This can also be a function, like args
        prepend_args = { "--config", vim.env.XDG_CONFIG_HOME .. "/nvim/dprint.json" },
      },
      shfmt = {
        -- The base args are { "-filename", "$FILENAME" } so the final args will be
        -- { "-i", "2", "-filename", "$FILENAME" }
        prepend_args = { "-i", "2" },
      },
    },
  },
}
