return {
  "RRethy/nvim-treesitter-textsubjects",
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter.configs").setup({
      textsubjects = {
        enable = true,
        prev_selection = ",", -- (Optional) keymap to select the previous selection
        keymaps = {
          ["v"] = "textsubjects-smart",
          ["o"] = "textsubjects-container-outer",
          ["u"] = "textsubjects-container-inner",
        },
      },
    })
  end,
}
