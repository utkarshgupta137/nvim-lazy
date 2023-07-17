local Util = require("lazyvim.util")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle show<cr>", desc = "Toggle Explorer" },
      { "<leader>E", "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
    },
    opts = {
      auto_clean_after_session_restore = true, -- Automatically clean up broken neo-tree buffers saved in sessions
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      filesystem = {
        bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
        },
        group_empty_dirs = true, -- when true, empty folders will be grouped together
      },
      window = {
        mappings = {
          P = { "toggle_preview", config = { use_float = false } },
          C = "close_all_subnodes",
          Z = "expand_all_nodes",

          o = "open",
          O = "system_open",
          h = "parent_or_close",
          l = "child_or_open",
          Y = "copy_selector",
        },
      },

      -- Ref: https://github.com/nvim-neo-tree/neo-tree.nvim#configuration-for-nerd-fonts-v3-users
      default_component_configs = {
        icon = {
          folder_empty = "󰜌",
          folder_empty_open = "󰜌",
        },
        git_status = {
          symbols = {
            renamed = "󰁕",
            unstaged = "󰄱",
          },
        },
      },
      document_symbols = {
        kinds = {
          File = { icon = "󰈙", hl = "Tag" },
          Namespace = { icon = "󰌗", hl = "Include" },
          Package = { icon = "󰏖", hl = "Label" },
          Class = { icon = "󰌗", hl = "Include" },
          Property = { icon = "󰆧", hl = "@property" },
          Enum = { icon = "󰒻", hl = "@number" },
          Function = { icon = "󰊕", hl = "Function" },
          String = { icon = "󰀬", hl = "String" },
          Number = { icon = "󰎠", hl = "Number" },
          Array = { icon = "󰅪", hl = "Type" },
          Object = { icon = "󰅩", hl = "Type" },
          Key = { icon = "󰌋", hl = "" },
          Struct = { icon = "󰌗", hl = "Type" },
          Operator = { icon = "󰆕", hl = "Operator" },
          TypeParameter = { icon = "󰊄", hl = "Type" },
          StaticMethod = { icon = "󰠄 ", hl = "Function" },
        },
      },

      -- Ref: https://github.com/AstroNvim/AstroNvim/blob/main/lua/plugins/neo-tree.lua
      commands = {
        system_open = function(state)
          -- Ref: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/utils/init.lua
          local system_open = function(path)
            local cmd
            if vim.fn.has("win32") == 1 and vim.fn.executable("explorer") == 1 then
              cmd = { "cmd.exe", "/K", "explorer" }
            elseif vim.fn.has("unix") == 1 and vim.fn.executable("xdg-open") == 1 then
              cmd = { "xdg-open" }
            elseif (vim.fn.has("mac") == 1 or vim.fn.has("unix") == 1) and vim.fn.executable("open") == 1 then
              cmd = { "open" }
            end
            if not cmd then vim.notify("Available system opening tool not found!", vim.log.levels.ERROR) end
            vim.fn.jobstart(vim.fn.extend(cmd, { path or vim.fn.expand("<cfile>") }), { detach = true })
          end

          system_open(state.tree:get_node():get_id())
        end,
        parent_or_close = function(state)
          local node = state.tree:get_node()
          if (node.type == "directory" or node:has_children()) and node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        child_or_open = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" or node:has_children() then
            if not node:is_expanded() then -- if unexpanded, expand
              state.commands.toggle_node(state)
            else -- if expanded and has children, seleect the next child
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          else -- if not a directory just open it
            state.commands.open(state)
          end
        end,
        copy_selector = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local filename = node.name
          local modify = vim.fn.fnamemodify

          local results = {
            { key = "a", val = filepath, msg = "Absolute path" },
            { key = "h", val = modify(filepath, ":~"), msg = "Path relative to Home" },
            { key = "r", val = modify(filepath, ":."), msg = "Path relative to CWD" },
            { key = "f", val = filename, msg = "Filename" },
            { key = "e", val = modify(filename, ":r"), msg = "Filename w/o extension" },
          }

          local messages = {
            { "\nChoose to copy to clipboard:\n", "Normal" },
          }
          for _, result in ipairs(results) do
            if result.val and result.val ~= "" then
              vim.list_extend(messages, {
                { ("%s."):format(result.key), "Identifier" },
                { (" %s: "):format(result.msg) },
                { result.val, "String" },
                { "\n" },
              })
            end
          end
          vim.api.nvim_echo(messages, false, {})
          local result = results[vim.fn.getcharstr()]
          if result and result.val and result.val ~= "" then
            vim.notify("Copied: " .. result.val)
            vim.fn.setreg("+", result.val)
          end
        end,
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>,", false },
      { "<leader>/", false },
      { "<leader>:", false },
      { "<leader>v", Util.telescope("resume"), desc = "Telescope Resume" },
      { "<leader>fo", Util.telescope("oldfiles"), desc = "Recent (root dir)" },
      { "<leader>fO", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
    },
    dependencies = {
      "nvim-telescope/telescope-frecency.nvim",
    },
    opts = {
      defaults = {
        dynamic_preview_title = true,
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            mirror = true,
            prompt_position = "top",
            preview_height = 0.4,
          },
          width = 0.90,
          height = 0.90,
          preview_cutoff = 0,
        },
        sorting_strategy = "ascending",
        selection_strategy = "follow",
      },
      pickers = {
        lsp_references = { path_display = { "smart" } },
        lsp_definitions = { path_display = { "smart" } },
        lsp_type_definitions = { path_display = { "smart" } },
        lsp_implementations = { path_display = { "smart" } },
      },
    },
  },

  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },

  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.defaults["<leader>q"] = nil
      opts.defaults["<leader>c"] = nil
      opts.defaults["<leader>w"] = nil
      opts.defaults["<leader>n"] = { name = "+neovim" }
      opts.defaults["<leader>l"] = { name = "+lsp" }
      opts.defaults["<leader>S"] = { name = "+session" }
      opts.defaults["R"] = { name = "+rust" }
      opts.defaults["RC"] = { name = "+crates" }
      opts.defaults["gs"] = { name = "+splitjoin" }
      opts.defaults["gt"] = { name = "+text-case (word)" }
      opts.defaults["go"] = { name = "+text-case (operator)" }
      opts.defaults["gl"] = { name = "+text-case (LSP rename)" }
      return opts
    end,
  },

  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>c", '<cmd>lua require("mini.bufremove").delete(0, false)<cr>', desc = "Delete Buffer" },
    },
  },
}
