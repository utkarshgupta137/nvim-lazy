return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  opts = {
    max_lines = 5,
    mode = "topline",
    on_attach = function() return vim.bo.filetype ~= "markdown" end,
  },
}
