return {
  "axieax/urlview.nvim",
  branch = "url-parser",
  init = function()
    vim.api.nvim_create_autocmd("BufReadPost", {
      desc = "HighlightUrls",
      callback = function() require("urlview.parser").parse() end,
    })
  end,
  event = "BufReadPost",
  opts = {},
}
