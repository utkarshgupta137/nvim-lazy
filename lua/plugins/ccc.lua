return {
  "uga-rosa/ccc.nvim",
  event = "BufReadPost",
  keys = {
    { "<leader>uh", "<cmd>CccPick<cr>", desc = "Toggle colorizer" },
  },
  opts = {
    preserve = true,
    highlighter = {
      auto_enable = true,
    },
  },
}
