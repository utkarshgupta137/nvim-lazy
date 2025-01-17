return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                enforce = true,
                group = "module",
              },
              preferPredule = true,
              prefix = "crate",
            },
            references = {
              excludeImports = true,
              excludeTests = true,
            },
          },
        },
      },
    },
  },
}
