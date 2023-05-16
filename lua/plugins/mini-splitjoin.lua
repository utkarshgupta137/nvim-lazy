return {
  "echasnovski/mini.splitjoin",
  event = "VeryLazy",
  opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    -- Created for both Normal and Visual modes.
    mappings = {
      toggle = "gst",
      split = "gss",
      join = "gsj",
    },

    -- Detection options: where split/join should be done
    detect = {
      -- Array of Lua patterns to detect region with arguments.
      -- Default: { '%b()', '%b[]', '%b{}' }
      brackets = { "%b()", "%b[]", "%b{}", "%b<>" },

      -- Array of Lua patterns for sub-regions to exclude separators from.
      -- Enables correct detection in presence of nested brackets and quotes.
      -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
      exclude_regions = { "%b()", "%b[]", "%b{}", "%b<>", '%b""', "%b''" },
    },
  },
}
