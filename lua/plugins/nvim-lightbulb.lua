return {
  "utkarshgupta137/nvim-lightbulb",
  event = "LspAttach",
  opts = {
    sign = {
      -- Priority of the gutter sign
      priority = 100,
    },
    autocmd = {
      enabled = true,
    },
    -- Only show the lightbulb if the code action is a "quickfix" action (blue lightbulb in VSCode)
    quickfix_only = true,
  },
}
