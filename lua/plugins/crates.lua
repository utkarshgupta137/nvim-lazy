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
        require("crates")
      end,
    })
  end,
  keys = {
    { "RCt", '<cmd>lua require("crates").toggle()<cr>', desc = "Toggle" },
    { "RCr", '<cmd>lua require("crates").reload()<cr>', desc = "Reload" },

    { "RCv", '<cmd>lua require("crates").show_versions_popup()<cr>', desc = "Show Versions" },
    { "RCf", '<cmd>lua require("crates").show_features_popup()<cr>', desc = "Show Features" },
    { "RCd", '<cmd>lua require("crates").show_dependencies_popup()<cr>', desc = "Show Dependencies" },

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
  },
  opts = {
    null_ls = {
      enabled = true,
      name = "crates.nvim",
    },
  },
}