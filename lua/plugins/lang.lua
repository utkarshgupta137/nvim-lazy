return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            assist = {
              preferSelf = true,
            },
            hover = {
              memoryLayout = {
                alignment = "both",
                offset = "both",
                padding = "both",
                size = "both",
              },
              show = {
                enumVariants = 8,
                fields = 8,
                traitAssocItems = 3,
              },
            },
            imports = {
              granularity = {
                enforce = true,
                group = "module",
              },
              preferPredule = true,
            },
            references = {
              excludeImports = true,
              excludeTests = true,
            },
            workspace = {
              symbol = {
                search = {
                  excludeImports = true,
                },
              },
            },
          },
        },
      },
    },
  },
}
