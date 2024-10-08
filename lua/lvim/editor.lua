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
          -- TODO: just use vim.ui.open when dropping support for Neovim <0.10
          -- Ref: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/utils/init.lua
          local system_open = function(path)
            -- TODO: REMOVE WHEN DROPPING NEOVIM <0.10
            if vim.ui.open then return vim.ui.open(path) end
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

          local vals = {
            ["BASENAME"] = modify(filename, ":r"),
            ["EXTENSION"] = modify(filename, ":e"),
            ["FILENAME"] = filename,
            ["PATH (CWD)"] = modify(filepath, ":."),
            ["PATH (HOME)"] = modify(filepath, ":~"),
            ["PATH"] = filepath,
            ["URI"] = vim.uri_from_fname(filepath),
          }

          local options = vim.tbl_filter(function(val) return vals[val] ~= "" end, vim.tbl_keys(vals))
          if vim.tbl_isempty(options) then
            vim.notify("No values to copy", vim.log.levels.WARN)
            return
          end
          table.sort(options)
          vim.ui.select(options, {
            prompt = "Choose to copy to clipboard:",
            format_item = function(item) return ("%s: %s"):format(item, vals[item]) end,
          }, function(choice)
            local result = vals[choice]
            if result then
              vim.notify(("Copied: `%s`"):format(result))
              vim.fn.setreg("+", result)
            end
          end)
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
      { "<leader>n", "<cmd>Telescope resume<cr>", desc = "Telescope Resume" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent (root dir)" },
      { "<leader>fO", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
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
            preview_height = 0.5,
          },
          width = 0.90,
          height = 0.90,
          preview_cutoff = 0,
        },
        path_display = {
          filename_first = {
            reverse_directories = true,
          },
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

  { "folke/flash.nvim", enabled = false },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>q", desc = "Quit" },
        { "<leader>w", desc = "Save" },
        { "<leader>wm", hidden = true },
        { "<leader>S", group = "session" },
        { "<leader>R", group = "rust" },
        { "<leader>C", group = "crates" },
        { "gl", group = "text-case (LSP rename)" },
        { "go", group = "text-case (operator)" },
        { "gs", group = "splitjoin" },
        { "gt", group = "text-case (word)" },
        { "s", group = "surround" },
      },
    },
  },

  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>v", '<cmd>lua require("mini.bufremove").delete(0, false)<cr>', desc = "Delete Buffer" },
    },
  },
}
