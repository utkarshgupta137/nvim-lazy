return {
  "utkarshgupta137/lsp-inlayhints.nvim",
  init = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LspInlayHints",
      callback = function(args)
        if not (args.data and args.data.client_id) then return end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, bufnr, false)
      end,
    })
  end,
  opts = {
    inlay_hints = {
      position = {
        -- where to show the hints. values can be:
        --   nil: show hints after the end of the line
        --   "max_len": show hints after the longest line in the file
        --   "fixed_col": show hints relative to the start of the line (setting padding to ~100)
        align = "fixed_col",
        -- extra padding on the left if align is not nil
        padding = 102,
      },
    },
  },
}
