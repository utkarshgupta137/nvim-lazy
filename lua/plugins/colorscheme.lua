return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },

  {
    "catppuccin",
    enabled = false,
  },

  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep",
      colors = {
        white = "#eeeeee",
        cream = "#fcf1cf",
      },
      highlights = {
        ["@function.macro"] = { fg = "$orange", fmt = "italic" },
        ["@module"] = { fg = "$cyan" },
        ["@type.builtin"] = { fg = "$blue" },
        ["@variable"] = { fg = "$cream" },
        ["@variable.member"] = { fg = "$red" },
        ["@variable.parameter"] = { fmt = "italic" },

        ["@lsp.mod.mutable"] = { fmt = "bold,underline" },
        ["@lsp.type.builtinType"] = { fg = "$blue" },
        ["@lsp.type.enum"] = { fg = "$cyan" },
        ["@lsp.type.generic"] = { fg = "$cream" },
        ["@lsp.type.interface"] = { fg = "$blue" },
        ["@lsp.type.macro"] = { fg = "$orange", fmt = "italic" },
        ["@lsp.type.namespace"] = { fg = "$cyan" },
        ["@lsp.type.parameter"] = { fmt = "italic" },
        ["@lsp.type.property"] = { fg = "$red" },
        ["@lsp.type.selfKeyword"] = { fg = "$purple", fmt = "italic" },
        ["@lsp.type.selfTypeKeyword"] = { fg = "$purple" },
        ["@lsp.type.typeParameter"] = { fg = "$white" },
        ["@lsp.type.variable"] = { fg = "$cream" },
        ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = "$yellow" },
      },
    },
  },
}
