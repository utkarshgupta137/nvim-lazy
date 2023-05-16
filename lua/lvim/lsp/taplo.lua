return function()
  require("lazyvim.util").on_attach(function(client, buffer)
    if client.name == "taplo" and vim.fn.expand("%:t") == "Cargo.toml" then
      local crates = require("crates")
      vim.keymap.set("n", "K", function()
        if crates.popup_available() then
          crates.show_popup()
        else
          vim.lsp.buf.hover()
        end
      end, { buffer = buffer })
    end
  end)

  return false -- make sure the base implementation calls taplo.setup
end
