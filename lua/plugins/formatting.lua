return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["json"] = { "dprint" },
        ["jsonc"] = { "dprint" },
        ["markdown"] = { "dprint" },
        ["markdown.mdx"] = { "dprint" },
        ["sql"] = { "dprint" },
        ["toml"] = { "dprint" },
        ["yaml"] = { "dprint" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-s", "-i", "2", "-bn", "-ci" },
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "dprint" },
    },
  },
}
