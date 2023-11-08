return {
  "olimorris/persisted.nvim",
  dependencies = {
    "akinsho/bufferline.nvim",
    "nvim-neo-tree/neo-tree.nvim",
  },
  init = function() require("telescope").load_extension("persisted") end,
  event = "VeryLazy",
  keys = {
    { "<leader>Ss", "<cmd>SessionSave<cr>", desc = "Save" },
    { "<leader>Sl", "<cmd>SessionLoad<cr>", desc = "Load" },
    { "<leader>SL", "<cmd>SessionLoadLast<cr>", desc = "Load Last" },
    { "<leader>Sf", "<cmd>SessionLoadFromFile<cr>", desc = "Load from File" },
    { "<leader>Sd", "<cmd>SessionDelete<cr>", desc = "Delete" },
    { "<leader>St", "<cmd>SessionToggle<cr>", desc = "Toggle" },
    { "<leader>Sb", "<cmd>SessionStart<cr>", desc = "Start" },
    { "<leader>Se", "<cmd>SessionStop<cr>", desc = "Stop" },
    { "<leader>Sf", "<cmd>Telescope persisted<cr>", desc = "Telescope" },
  },
  opts = {
    save_dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
    autoload = true, -- automatically load the session for the cwd on Neovim startup
    follow_cwd = true, -- change session file name to match current working directory if it changes
  },
  config = function(_, opts)
    require("persisted").setup(opts)
    vim.fn.timer_start(500, function() vim.cmd("Neotree toggle show") end)
  end,
}
