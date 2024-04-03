return {
  "simrat39/rust-tools.nvim",
  keys = {
    { "Ra", "<cmd>RustCodeAction<cr>", desc = "Code Action" },
    { "Rs", "<cmd>RustSSR<cr>", desc = "Structural Search & Replace" },

    { "Rh", "<cmd>RustHoverActions<cr>", desc = "Hover Actions" },
    { "RH", "<cmd>RustHoverRange<cr>", desc = "Hover Range" },
    { "Re", "<cmd>RustExpandMacro<cr>", desc = "Expand Macro" },
    { "Ro", "<cmd>RustOpenExternalDocs<cr>", desc = "Open External Docs" },

    { "RD", "<cmd>RustDebuggables<cr>", desc = "Debuggables" },
    { "Rd", "<cmd>RustLastDebug<cr>", desc = "Last Debug" },
    { "RR", "<cmd>RustRunnables<cr>", desc = "Runnables" },
    { "Rr", "<cmd>RustLastRun<cr>", desc = "Last Run" },

    { "Rp", "<cmd>RustParentModule<cr>", desc = "Parent Module" },
    { "RJ", "<cmd>RustJoinLines<cr>", desc = "Join Lines" },
    { "Rj", "<cmd>RustMoveItemDown<cr>", desc = "Move Item Down" },
    { "Rk", "<cmd>RustMoveItemUp<cr>", desc = "Move Item Up" },

    { "Rw", "<cmd>RustReloadWorkspace<cr>", desc = "Reload Workspace" },
    { "RCo", "<cmd>RustOpenCargo<cr>", desc = "Open Cargo.toml" },
    { "RCv", "<cmd>RustViewCrateGraph<cr>", desc = "View Crate Graph" },

    { "Rf", "<cmd>RustFlyCheck<cr>", desc = "Run Fly Check" },
    {
      "Rc",
      function()
        local clients = vim.lsp.get_active_clients()
        for _, client in ipairs(clients) do
          if client.name == "rust_analyzer" then
            local settings = client.config.settings["rust-analyzer"]
            if settings.check.command ~= "check" then
              settings.check.command = "check"
            else
              settings.check.command = "cranky"
            end

            client.notify("workspace/didChangeConfiguration", {
              settings = client.config.settings,
            })
            vim.notify("New check command: " .. settings.check.command)
            break
          end
        end
      end,
      desc = "Toggle Check Command",
    },
  },
  opts = {
    tools = { -- rust-tools options
      -- These apply to the default RustSetInlayHints command
      inlay_hints = {
        -- automatically set inlay hints (type hints)
        -- default: true
        auto = false,
      },
    },
  },
}
