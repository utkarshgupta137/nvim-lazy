return {
  "kosayoda/nvim-lightbulb",
  event = "LspAttach",
  keys = {
    {
      "<leader>cq",
      function() vim.lsp.buf.code_action({ context = { only = { "quickfix" } }, apply = true }) end,
      desc = "QuickFix Code Action",
    },
  },
  opts = {
    -- Priority of the lightbulb for all handlers except float.
    priority = 100,

    -- Code action kinds to observe.
    -- To match all code actions, set to `nil`.
    -- Otherwise, set to a table of kinds.
    -- Example: { "quickfix", "refactor.rewrite" }
    -- See: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#codeActionKind
    action_kinds = { "quickfix" },

    -- Autocmd configuration.
    -- If enabled, automatically defines an autocmd to show the lightbulb.
    -- If disabled, you will have to manually call |NvimLightbulb.update_lightbulb|.
    -- Only works if configured during NvimLightbulb.setup
    autocmd = {
      -- Whether or not to enable autocmd creation.
      enabled = true,
    },

    -- Scenarios to not show a lightbulb.
    ignore = {
      -- LSP client names to ignore.
      -- Example: {"null-ls", "lua_ls"}
      clients = { "marksman" },
      -- Ignore code actions without a `kind` like refactor.rewrite, quickfix.
      actions_without_kind = true,
    },
  },
}
