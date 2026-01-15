return {
  {
    "folke/persistence.nvim",
    enabled = false,
  },

  {
    "olimorris/persisted.nvim",
    lazy = false,
    keys = {
      { "<leader>qs", "<cmd>Persisted load<cr>", desc = "Restore Session" },
      { "<leader>qS", "<cmd>Persisted select<cr>", desc = "Select Session" },
      { "<leader>ql", "<cmd>Persisted load_last<cr>", desc = "Restore Last Session" },
      { "<leader>qd", "<cmd>Persisted stop<cr>", desc = "Don't Save Current Session" },
    },
    opts = {
      save_dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
      autoload = true,
    },
  },

  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
}
