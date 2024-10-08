return {
  "mrcjkb/rustaceanvim",
  enabled = false,
  keys = {
    { "<leader>Ra", "<cmd>RustLsp codeAction<cr>", desc = "Code Action" },
    { "<leader>Rs", "<cmd>RustLsp ssr<cr>", desc = "Structural Search & Replace" },

    { "<leader>Rh", "<cmd>RustLsp hover action<cr>", desc = "Hover Actions" },
    { "<leader>RH", "<cmd>RustLsp hover range<cr>", desc = "Hover Range" },
    { "<leader>Re", "<cmd>RustLsp expandMacro<cr>", desc = "Expand Macro" },
    { "<leader>Ro", "<cmd>RustLsp externalDocs<cr>", desc = "Open External Docs" },

    { "<leader>Rw", "<cmd>RustLsp workspaceSymbol<cr>", desc = "Workspace Symbol" },
    { "<leader>RD", "<cmd>RustLsp debuggables<cr>", desc = "Debuggables" },
    { "<leader>Rd", "<cmd>RustLsp! debuggables<cr>", desc = "Last debuggable" },
    { "<leader>RR", "<cmd>RustLsp testables<cr>", desc = "Testables" },
    { "<leader>Rt", "<cmd>RustLsp! testables<cr>", desc = "Last testable" },
    { "<leader>RR", "<cmd>RustLsp runnables<cr>", desc = "Runnables" },
    { "<leader>Rr", "<cmd>RustLsp! runnables<cr>", desc = "Last runnable" },

    { "<leader>Rp", "<cmd>RustLsp parentModule<cr>", desc = "Parent Module" },
    { "<leader>RJ", "<cmd>RustLsp joinLines<cr>", desc = "Join Lines" },
    { "<leader>Rj", "<cmd>RustLsp moveItem down<cr>", desc = "Move Item Down" },
    { "<leader>Rk", "<cmd>RustLsp moveItem up<cr>", desc = "Move Item Up" },

    { "<leader>Rw", "<cmd>RustLsp reloadWorkspace<cr>", desc = "Reload Workspace" },
    { "<leader>RCo", "<cmd>RustLsp openCargo<cr>", desc = "Open Cargo.toml" },
    { "<leader>RCv", "<cmd>RustLsp crateGraph<cr>", desc = "View Crate Graph" },

    {
      "<leader>Rc",
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
