local function make_cmp_kind_comparator()
  local types = require("cmp.types")
  local kinds = types.lsp.CompletionItemKind
  local priorities = {
    [kinds.Field] = -99,
    [kinds.Property] = -98,
    [kinds.EnumMember] = -97,

    [kinds.Method] = -89,
    [kinds.Function] = -88,
    [kinds.Constructor] = -87,

    [kinds.Variable] = -79,
    [kinds.Constant] = -78,

    [kinds.Class] = -69,
    [kinds.Struct] = -68,
    [kinds.Enum] = -67,
    [kinds.Interface] = -66,
    [kinds.TypeParameter] = -65,

    [kinds.Module] = -59,
    [kinds.Keyword] = -58,
    [kinds.Operator] = -57,
    [kinds.Reference] = -56,

    [kinds.Snippet] = -49,
    [kinds.Event] = -48,
    [kinds.Color] = -47,

    [kinds.Unit] = -39,
    [kinds.Value] = -38,
    [kinds.File] = -37,
    [kinds.Folder] = -36,

    [kinds.Text] = 100,
  }

  local function comparator(entry1, entry2)
    local kind1, kind2 = entry1:get_kind(), entry2:get_kind()
    local diff = priorities[kind1] - priorities[kind2]
    if diff < 0 then
      return true
    elseif diff > 0 then
      return false
    end
  end
  return comparator
end

return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      local compare = cmp.config.compare
      opts.sorting = {
        comparators = {
          compare.offset,
          compare.exact,
          -- compare.scopes,
          compare.score,
          compare.recently_used,
          make_cmp_kind_comparator(),
          compare.locality,
          -- compare.kind,
          -- compare.sort_text,
          -- compare.length,
          compare.order,
        },
      }

      opts.mapping["<S-CR>"] = cmp.mapping(function(fallback) fallback() end, { "i", "s", "c" })
    end,
  },

  {
    "echasnovski/mini.pairs",
    opts = {
      -- Global mappings. Each right hand side should be a pair information, a
      -- table with at least these fields (see more in |MiniPairs.map|):
      -- - <action> - one of 'open', 'close', 'closeopen'.
      -- - <pair> - two character string for pair to be used.
      -- By default pair is not inserted after `\`, quotes are not recognized by
      -- `<CR>`, `'` does not insert pair after a letter.
      -- Only parts of tables can be tweaked (others will use these defaults).
      mappings = {
        ["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },

        [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },

        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\&<].", register = { cr = false } },
      },
    },
  },

  {
    "echasnovski/mini.surround",
    opts = {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    },
  },

  {
    "echasnovski/mini.comment",
    opts = {
      -- Options which control module behavior
      options = {
        -- Whether to ignore blank lines
        ignore_blank_line = true,
      },
    },
  },
}
