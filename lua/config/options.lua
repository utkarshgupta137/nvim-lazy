-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.colorcolumn = "101"
opt.listchars:remove("trail")
opt.pumheight = 0
opt.sessionoptions = { "buffers", "globals", "help", "winpos", "winsize" }
opt.signcolumn = "yes:2"
