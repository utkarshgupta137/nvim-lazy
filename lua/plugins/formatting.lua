return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {},
      formatters = {
        shfmt = {
          prepend_args = { "-s", "-i", "2", "-bn", "-ci" },
        },
      },
    },
  },
}
