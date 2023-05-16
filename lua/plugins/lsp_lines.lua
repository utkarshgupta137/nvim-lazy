return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  init = function() vim.diagnostic.config({ virtual_lines = { only_current_line = true } }) end,
  event = "LspAttach",
  keys = {
    {
      "<leader>uL",
      function()
        local config = vim.diagnostic.config()
        if config.virtual_lines then
          vim.diagnostic.config({ virtual_lines = false })
        else
          vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
        end
      end,
      desc = "Toggle LSP lines",
    },
  },
  opts = {},
}
