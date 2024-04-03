-- Ref: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
-- black = "#0c0e15",
-- bg0 = "#1a212e",
-- bg1 = "#21283b",
-- bg2 = "#283347",
-- bg3 = "#2a324a",
-- bg_d = "#141b24",
-- bg_blue = "#54b0fd",
-- bg_yellow = "#f2cc81",
-- fg = "#93a4c3",
-- purple = "#c75ae8",
-- green = "#8bcd5b",
-- orange = "#dd9046",
-- blue = "#41a7fc",
-- yellow = "#efbd5d",
-- cyan = "#34bfd0",
-- red = "#f65866",
-- grey = "#455574",
-- light_grey = "#6c7d9c",
-- dark_cyan = "#1b6a73",
-- dark_red = "#992525",
-- dark_yellow = "#8f610d",
-- dark_purple = "#862aa1",
-- diff_add = "#27341c",
-- diff_delete = "#331c1e",
-- diff_change = "#102b40",
-- diff_text = "#1c4a6e",

return {
  "navarasu/onedark.nvim",
  priority = 1000,
  opts = {
    -- Main options --
    style = "deep", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'

    -- Custom Highlights --
    colors = { -- Override default colors
      dark = "#1d1f21",
      bg4 = "#3b4261",
      white = "#eeeeee",
      cream = "#fcf1cf",
    },
    highlights = { -- Override highlight groups
      ["NormalDark"] = { bg = "$dark" },

      ["IndentBlanklineChar"] = { fg = "$bg3" },
      ["MiniIndentscopeSymbol"] = { fg = "$bg_blue" },

      ["IlluminatedWordText"] = { bg = "$bg4" },
      ["IlluminatedWordRead"] = { bg = "$bg4" },
      ["IlluminatedWordWrite"] = { bg = "$bg4" },

      ["StorageClass"] = { fg = "$white" },

      ["@field"] = { fg = "$red" },
      ["@function.macro"] = { fg = "$orange", fmt = "italic" },
      ["@namespace"] = { fg = "$cyan" },
      ["@parameter"] = { fg = "$red", fmt = "italic" },
      ["@punctuation.special"] = { fg = "$purple" },
      ["@type.builtin"] = { fg = "$blue" },
      ["@type.qualifier"] = { fg = "$purple" },
      ["@variable"] = { fg = "$cream" },

      ["@lsp.mod.constant"] = { fg = "$orange" },
      ["@lsp.mod.mutable"] = { fmt = "bold,underline" },
      ["@lsp.type.attributeBracket"] = { fg = "$white" },
      ["@lsp.type.builtinType"] = { fg = "$blue" },
      ["@lsp.type.decorator"] = { fg = "$orange" },
      ["@lsp.type.enum"] = { fg = "$cyan" },
      ["@lsp.type.generic"] = { fg = "$cream" },
      ["@lsp.type.interface"] = { fg = "$blue" },
      ["@lsp.type.macro"] = { fg = "$orange", fmt = "italic" },
      ["@lsp.type.namespace"] = { fg = "$cyan" },
      ["@lsp.type.parameter"] = { fg = "$red", fmt = "italic" },
      ["@lsp.type.property"] = { fg = "$red" },
      ["@lsp.type.selfKeyword"] = { fg = "$purple", fmt = "italic" },
      ["@lsp.type.selfTypeKeyword"] = { fg = "$purple" },
      ["@lsp.type.typeParameter"] = { fg = "$white" },
      ["@lsp.type.variable"] = { fg = "$cream" },
      ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = "$yellow" },
      ["@lsp.typemod.keyword.constant"] = { fg = "$purple" },
    },
  },
}
