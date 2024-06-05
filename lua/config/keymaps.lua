-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local map = vim.keymap.set

-- motions
map({ "n", "v" }, "0", "_")
map({ "n", "v" }, "_", "-")
map({ "n", "v" }, "-", "$")
map({ "n", "v" }, "=", "%")

map({ "n", "v" }, "[[", "{", { desc = "Previous empty line" })
map({ "n", "v" }, "]]", "}", { desc = "Next empty line" })
map({ "n", "v" }, "gg", "gg_")
map({ "n", "v" }, "n", "nzz")
map({ "n", "v" }, "N", "Nzz")
map({ "n", "v" }, "<C-a>", "zz<C-u>")
map({ "n", "v" }, "<C-d>", "zz<C-d>")

-- actions
map({ "n", "v", "i" }, "<C-r>", "<cmd>w<cr><esc><cmd>source<cr>", { desc = "Save & Source File" })

map("n", "<M-f>", "<cmd>ToggleDeco<cr>", { desc = "Toggle Indents & Rainbow" })
map("n", "<leader>xr", vim.diagnostic.reset, { desc = "Reset Diagnostics" })

map({ "n", "v" }, "J", "mzJ`z", { desc = "Join Lines (keep cursor)" })

map({ "n", "v" }, "U", "<C-r>", { desc = "Redo" })
map({ "n", "v" }, "<C-u>", "<C-r>", { desc = "Redo" })

map({ "n", "v" }, "<M-c>", "c", { desc = "Replace" })
map({ "n", "v" }, "<M-d>", "d", { desc = "Cut" })
map("n", "<M-C>", "C", { desc = "Replace to End" })
map("n", "<M-D>", "D", { desc = "Cut to End" })
map("n", "<M-c><M-c>", "cc", { desc = "Replace Line" })
map("n", "<M-d><M-d>", "dd", { desc = "Cut Line" })

map("v", "<Tab>", ">gv", { desc = "Indent Line" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent Line" })

map("n", "<leader>r", ":%sno/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Search & Replace Word" })
map("v", "<leader>r", 'y:%sno/<C-r>"/<C-r>"/gI<Left><Left><Left>', { desc = "Search & Replace Word" })

-- stylua: ignore
map(
  "n",
  "<leader>gg",
  function() Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false, size = { width = 0.98, height = 0.95 }, cwd = Util.root() }) end,
  { desc = "Lazygit (root dir)" }
)
-- stylua: ignore
map(
  "n",
  "<leader>gG",
  function() Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false, size = { width = 0.98, height = 0.95 } }) end,
  { desc = "Lazygit (cwd)" }
)

-- override LazyVim
pcall(vim.keymap.del, "n", "<A-j>")
pcall(vim.keymap.del, "n", "<A-k>")
pcall(vim.keymap.del, "i", "<A-j>")
pcall(vim.keymap.del, "i", "<A-k>")
pcall(vim.keymap.del, "v", "<A-j>")
pcall(vim.keymap.del, "v", "<A-k>")
map("n", "<M-J>", "<cmd>m .+1<cr>==", { desc = "Move Line down" })
map("n", "<M-K>", "<cmd>m .-2<cr>==", { desc = "Move Line up" })
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Line down" })
map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Line up" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

pcall(vim.keymap.del, "n", "<leader>`")
map("n", "<leader><leader>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

pcall(vim.keymap.del, "n", "<leader>qq")
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })

pcall(vim.keymap.del, "n", "<leader>ww")
pcall(vim.keymap.del, "n", "<leader>wd")
pcall(vim.keymap.del, "n", "<leader>wm")
pcall(vim.keymap.del, "n", "<leader>w-")
pcall(vim.keymap.del, "n", "<leader>w|")
pcall(vim.keymap.del, "n", "<leader>-")
pcall(vim.keymap.del, "n", "<leader>|")
map({ "n", "v", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "|", "<C-W>v", { desc = "Split window right" })
map("n", "\\", "<C-W>s", { desc = "Split window below" })

pcall(vim.keymap.del, "n", "<leader>,")
pcall(vim.keymap.del, "n", "<leader>/")
pcall(vim.keymap.del, "n", "<leader>:")
