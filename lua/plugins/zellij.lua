return {
  "Lilja/zellij.nvim",
  keys = {
    {
      "<leader>gz",
      function()
        local zellij = require("zellij")
        zellij.ZellijCommand("run -c -- lazygit")
        zellij.ZellijCommand("ac toggle-fullscreen")
      end,
      desc = "Lazygit",
    },
  },
  opts = {},
}
