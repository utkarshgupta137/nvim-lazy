-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_create_autocmd({ "VimLeave" }, { callback = function() vim.cmd("sleep 10m") end })
