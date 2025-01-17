return {
  {
    "echasnovski/mini.pairs",
    opts = {
      mappings = {
        ["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },

        [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },

        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\&<].", register = { cr = false } },
      },
    },
  },

  {
    "gbprod/cutlass.nvim",
    event = "BufEnter",
    opts = {
      cut_key = "m",
      exclude = { "ns", "xs", "nS", "xS" },
      registers = {
        select = "s",
        delete = "d",
        change = "c",
      },
    },
  },
}
