return {
  {
    "folke/persistence.nvim",
    enabled = false,
  },

  {
    "olimorris/persisted.nvim",
    dependencies = {
      "akinsho/bufferline.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    lazy = false,
    keys = {
      { "<leader>qs", "<cmd>SessionLoad<cr>", desc = "Restore Session" },
      { "<leader>qS", "<cmd>SessionSelect<cr>", desc = "Select Session" },
      { "<leader>ql", "<cmd>SessionLoadLast<cr>", desc = "Restore Last Session" },
      { "<leader>qd", "<cmd>SessionStop<cr>", desc = "Don't Save Current Session" },
    },
    opts = {
      save_dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
      autoload = true,
    },
    config = function(_, opts)
      require("persisted").setup(opts)
      vim.fn.timer_start(0, function()
        vim.cmd("Neotree toggle show")
      end)
    end,
  },

  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
}
