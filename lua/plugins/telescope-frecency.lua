return {
  "nvim-telescope/telescope-frecency.nvim",
  dependencies = { "kkharji/sqlite.lua" },
  init = function() require("telescope").load_extension("frecency") end,
  keys = {
    { "<leader>fr", "<cmd>Telescope frecency<cr>", desc = "frecency (root dir)" },
    { "<leader>fR", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "frecency (cwd)" },
  },
  opts = {
    workspaces = {
      ["nvim"] = "~/.config/nvim",
      ["tfx"] = "~/tensorfox",
      ["nix"] = "~/utkarsh/nix",
    },
    db_safe_mode = true,
  },
}
