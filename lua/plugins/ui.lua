return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        show_buffer_close_icons = false,
        persist_buffer_sort = false,
        separator_style = "slope",
        always_show_bufferline = true,
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      scroll = {
        enabled = false,
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
  },

  {
    "bartek/epochconverter.nvim",
    event = "BufEnter",
    config = true,
  },
}
