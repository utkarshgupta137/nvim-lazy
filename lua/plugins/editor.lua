return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      window = {
        auto_expand_width = true,
      },
      filesystem = {
        bind_to_cwd = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
      group_empty_dirs = true,
    },
  },

  {
    "echasnovski/mini.move",
    opts = {
      mappings = {
        left = "<C-h>",
        right = "<C-l>",
        down = "<C-j>",
        up = "<C-k>",
      },
    },
  },
}
