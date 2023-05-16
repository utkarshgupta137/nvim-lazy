-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Term Background",
  command = "setlocal winhighlight=Normal:NormalDark",
})

vim.api.nvim_create_user_command("ToggleDeco", function()
  vim.cmd("IndentBlanklineToggle")
  vim.cmd("TSToggle rainbow")
end, { desc = "Toggle Indents & Rainbow" })
