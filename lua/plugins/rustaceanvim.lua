return {
  "mrcjkb/rustaceanvim",
  enabled = false,
  keys = {
    { "Ra", "<cmd>RustLsp codeAction<cr>", desc = "Code Action" },
    { "Rs", "<cmd>RustLsp ssr<cr>", desc = "Structural Search & Replace" },

    { "Rh", "<cmd>RustLsp hover action<cr>", desc = "Hover Actions" },
    { "RH", "<cmd>RustLsp hover range<cr>", desc = "Hover Range" },
    { "Re", "<cmd>RustLsp expandMacro<cr>", desc = "Expand Macro" },
    { "Ro", "<cmd>RustLsp externalDocs<cr>", desc = "Open External Docs" },

    { "Rw", "<cmd>RustLsp workspaceSymbol<cr>", desc = "Workspace Symbol" },
    { "RD", "<cmd>RustLsp debuggables<cr>", desc = "Debuggables" },
    { "Rd", "<cmd>RustLsp! debuggables<cr>", desc = "Last debuggable" },
    { "RR", "<cmd>RustLsp testables<cr>", desc = "Testables" },
    { "Rt", "<cmd>RustLsp! testables<cr>", desc = "Last testable" },
    { "RR", "<cmd>RustLsp runnables<cr>", desc = "Runnables" },
    { "Rr", "<cmd>RustLsp! runnables<cr>", desc = "Last runnable" },

    { "Rp", "<cmd>RustLsp parentModule<cr>", desc = "Parent Module" },
    { "RJ", "<cmd>RustLsp joinLines<cr>", desc = "Join Lines" },
    { "Rj", "<cmd>RustLsp moveItem down<cr>", desc = "Move Item Down" },
    { "Rk", "<cmd>RustLsp moveItem up<cr>", desc = "Move Item Up" },

    { "Rw", "<cmd>RustLsp reloadWorkspace<cr>", desc = "Reload Workspace" },
    { "RCo", "<cmd>RustLsp openCargo<cr>", desc = "Open Cargo.toml" },
    { "RCv", "<cmd>RustLsp crateGraph<cr>", desc = "View Crate Graph" },

    {
      "Rc",
      function()
        local clients = vim.lsp.get_active_clients()
        for _, client in ipairs(clients) do
          if client.name == "rust-analyzer" then
            local settings = client.config.default_settings["rust-analyzer"]
            if settings.checkOnSave.command ~= "check" then
              settings.checkOnSave.command = "check"
            else
              settings.checkOnSave.command = "cranky"
            end

            client.notify("workspace/didChangeConfiguration", {
              settings = client.config.default_settings,
            })
            vim.notify("New check command: " .. settings.checkOnSave.command)
            break
          end
        end
      end,
      desc = "Toggle Check Command",
    },
  },
  config = function()
    vim.g.rustaceanvim = {
      inlay_hints = {
        highlight = "NonText",
      },
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
      server = {
        on_attach = function(client, bufnr) require("lsp-inlayhints").on_attach(client, bufnr, false) end,
      },
    }
  end,
}
