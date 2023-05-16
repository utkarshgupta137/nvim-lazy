return {
  "gbprod/cutlass.nvim",
  event = "VimEnter",
  opts = {
    override_del = true,
    exclude = { "ns", "nS" },
    registers = {
      select = "s",
      delete = "d",
      change = "c",
    },
  },
}
