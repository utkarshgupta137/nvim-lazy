return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@type TSConfig
    opts = {
      ensure_installed = { "comment" },
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
    },
  },
}
