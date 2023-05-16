return function(_, server_opts)
  local mason_registry = require("mason-registry")
  local codelldb = mason_registry.get_package("codelldb")
  local extension_path = codelldb:get_install_path() .. "/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = vim.fn.has("mac") == 1 and extension_path .. "lldb/lib/liblldb.dylib"
    or extension_path .. "lldb/lib/liblldb.so"

  require("rust-tools").setup({
    tools = { -- rust-tools options
      -- These apply to the default RustSetInlayHints command
      inlay_hints = {
        -- automatically set inlay hints (type hints)
        -- default: true
        auto = false,
      },
    },
    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = vim.tbl_deep_extend("force", server_opts, {
      -- standalone file support
      -- setting it to false may improve startup time
      standalone = false,
    }),
    -- debugging stuff
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  })

  return true
end
