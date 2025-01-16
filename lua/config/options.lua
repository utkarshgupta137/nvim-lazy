-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false

local opt = vim.opt

opt.colorcolumn = "101"
opt.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"
opt.signcolumn = "yes:2"
