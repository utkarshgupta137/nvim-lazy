-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map({ "n", "v" }, "gg", "gg_")
map({ "n", "v" }, "n", "nzz")
map({ "n", "v" }, "N", "Nzz")
map({ "n", "v" }, "<C-u>", "zz<C-u>")
map({ "n", "v" }, "<C-d>", "zz<C-d>")
