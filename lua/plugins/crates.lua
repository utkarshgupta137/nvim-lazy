return {
  "Saecki/crates.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    vim.api.nvim_create_autocmd("BufRead", {
      pattern = "Cargo.toml",
      desc = "CmpSource crates.nvim",
      callback = function()
        require("cmp").setup.buffer({
          sources = {
            { name = "crates" },
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
          },
        })
      end,
    })
  end,
  event = { "BufRead Cargo.toml" },
  keys = {
    { "<leader>Ct", '<cmd>lua require("crates").toggle()<cr>', desc = "Toggle" },
    { "<leader>Cp", '<cmd>lua require("crates").update()<cr>', desc = "Update" },
    { "<leader>Cr", '<cmd>lua require("crates").reload()<cr>', desc = "Reload" },

    { "<leader>Cc", '<cmd>lua require("crates").show_crate_popup()<cr>', desc = "Show Crate" },
    { "<leader>Cv", '<cmd>lua require("crates").show_versions_popup()<cr>', desc = "Show Versions" },
    { "<leader>Cf", '<cmd>lua require("crates").show_features_popup()<cr>', desc = "Show Features" },
    { "<leader>Cd", '<cmd>lua require("crates").show_dependencies_popup()<cr>', desc = "Show Dependencies" },

    { "<leader>Ce", '<cmd>lua require("crates").expand_plain_crate_to_inline_table()<cr>', desc = "Expand Crate" },
    { "<leader>CE", '<cmd>lua require("crates").extract_crate_into_table()<cr>', desc = "Extract Crate" },

    { "<leader>Cu", '<cmd>lua require("crates").update_crate()<cr>', desc = "Update Crate" },
    { "<leader>Cu", '<cmd>lua require("crates").update_crates()<cr>', desc = "Update Crates", mode = "v" },
    { "<leader>Ca", '<cmd>lua require("crates").update_all_crates()<cr>', desc = "Update All Crates" },
    { "<leader>CU", '<cmd>lua require("crates").upgrade_crate()<cr>', desc = "Upgrade Crate" },
    { "<leader>CU", '<cmd>lua require("crates").upgrade_crates()<cr>', desc = "Upgrade Crates", mode = "v" },
    { "<leader>CA", '<cmd>lua require("crates").upgrade_all_crates()<cr>', desc = "Upgrade All Crates" },

    { "<leader>CH", '<cmd>lua require("crates").open_homepage()<cr>', desc = "Open Homepage" },
    { "<leader>CR", '<cmd>lua require("crates").open_repository()<cr>', desc = "Open Repository" },
    { "<leader>CD", '<cmd>lua require("crates").open_documentation()<cr>', desc = "Open Documentation" },
    { "<leader>CC", '<cmd>lua require("crates").open_crates_io()<cr>', desc = "Open Crates.io" },
    { "<leader>CL", '<cmd>lua require("crates").open_lib_rs()<cr>', desc = "Open Lib.rs" },
  },
}
