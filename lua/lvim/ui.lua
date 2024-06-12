return {
  {
    "rcarriga/nvim-notify",
    init = function() require("telescope").load_extension("notify") end,
    keys = {
      { "<leader>snf", "<cmd>Telescope notify<cr>", desc = "Telescope" },
    },
    opts = {
      max_width = 100,
      max_height = 30,
      stages = "static",
    },
  },

  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<b", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },
      { "<leader>bh", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },
      { ">b", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
      { "<leader>bl", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
      { "<M-!>", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to Buffer 1" },
      { "<M-@>", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to Buffer 2" },
      { "<M-#>", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to Buffer 3" },
      { "<M-$>", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to Buffer 4" },
      { "<M-%>", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to Buffer 5" },
      { "<M-^>", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Go to Buffer 6" },
      { "<M-&>", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Go to Buffer 7" },
      { "<M-*>", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Go to Buffer 8" },
      { "<M-(>", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Go to Buffer 9" },
      { "<M-)>", "<cmd>BufferLineGoToBuffer 10<cr>", desc = "Go to Buffer 10" },
    },
    opts = {
      options = {
        tab_size = 0,
        show_buffer_close_icons = false,
        persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = true, -- whether or not move command "cycles" at the first or last position
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "slope",
        always_show_bufferline = true,
      },
    },
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        highlight = {
          "IndentBlanklineChar",
        },
      },
    },
  },

  {
    "echasnovski/mini.indentscope",
    opts = {
      -- Draw options
      draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 50,

        -- Animation rule for scope's first drawing. A function which, given
        -- next and total step numbers, returns wait time (in ms). See
        -- |MiniIndentscope.gen_animation| for builtin options. To disable
        -- animation, use `require('mini.indentscope').gen_animation.none()`.
        animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },
}
