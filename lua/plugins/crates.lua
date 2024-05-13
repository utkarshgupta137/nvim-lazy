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
    { "RCt", '<cmd>lua require("crates").toggle()<cr>', desc = "Toggle" },
    { "RCp", '<cmd>lua require("crates").update()<cr>', desc = "Update" },
    { "RCr", '<cmd>lua require("crates").reload()<cr>', desc = "Reload" },

    { "RCc", '<cmd>lua require("crates").show_crate_popup()<cr>', desc = "Show Crate" },
    { "RCv", '<cmd>lua require("crates").show_versions_popup()<cr>', desc = "Show Versions" },
    { "RCf", '<cmd>lua require("crates").show_features_popup()<cr>', desc = "Show Features" },
    { "RCd", '<cmd>lua require("crates").show_dependencies_popup()<cr>', desc = "Show Dependencies" },

    { "RCe", '<cmd>lua require("crates").expand_plain_crate_to_inline_table()<cr>', desc = "Expand Crate" },
    { "RCE", '<cmd>lua require("crates").extract_crate_into_table()<cr>', desc = "Extract Crate" },

    { "RCu", '<cmd>lua require("crates").update_crate()<cr>', desc = "Update Crate" },
    { "RCu", '<cmd>lua require("crates").update_crates()<cr>', desc = "Update Crates", mode = "v" },
    { "RCa", '<cmd>lua require("crates").update_all_crates()<cr>', desc = "Update All Crates" },
    { "RCU", '<cmd>lua require("crates").upgrade_crate()<cr>', desc = "Upgrade Crate" },
    { "RCU", '<cmd>lua require("crates").upgrade_crates()<cr>', desc = "Upgrade Crates", mode = "v" },
    { "RCA", '<cmd>lua require("crates").upgrade_all_crates()<cr>', desc = "Upgrade All Crates" },

    { "RCH", '<cmd>lua require("crates").open_homepage()<cr>', desc = "Open Homepage" },
    { "RCR", '<cmd>lua require("crates").open_repository()<cr>', desc = "Open Repository" },
    { "RCD", '<cmd>lua require("crates").open_documentation()<cr>', desc = "Open Documentation" },
    { "RCC", '<cmd>lua require("crates").open_crates_io()<cr>', desc = "Open Crates.io" },
    { "RCL", '<cmd>lua require("crates").open_lib_rs()<cr>', desc = "Open Lib.rs" },
  },
}
