return {
  "mrjones2014/smart-splits.nvim",
  keys = {
    { "<C-h>", "<cmd>lua require('smart-splits').move_cursor_left()<cr>", desc = "Move to left split" },
    { "<C-j>", "<cmd>lua require('smart-splits').move_cursor_down()<cr>", desc = "Move to below split" },
    { "<C-k>", "<cmd>lua require('smart-splits').move_cursor_up()<cr>", desc = "Move to above split" },
    { "<C-l>", "<cmd>lua require('smart-splits').move_cursor_right()<cr>", desc = "Move to right split" },
    { "<C-w>r", "<cmd>lua require('smart-splits').start_resize_mode()<cr>", desc = "Resize mode" },
    { "<C-Up>", "<cmd>lua require('smart-splits').resize_up()<cr>", desc = "Resize split up" },
    { "<C-Down>", "<cmd>lua require('smart-splits').resize_down()<cr>", desc = "Resize split down" },
    { "<C-Left>", "<cmd>lua require('smart-splits').resize_left()<cr>", desc = "Resize split left" },
    { "<C-Right>", "<cmd>lua require('smart-splits').resize_right()<cr>", desc = "Resize split right" },
  },
  opts = {
    -- resize mode options
    resize_mode = {
      -- set to true to silence the notifications
      -- when entering/exiting persistent resize mode
      silent = true,
    },
  },
}
