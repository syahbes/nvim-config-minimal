return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          position = "right",
        },
        default_component_configs = {
          git_status = {
            symbols = {
              added     = "+",
              modified  = "●",
              deleted   = "-",
              renamed   = "R",
              untracked = "U",
              ignored   = "I",
              unstaged  = "",
              staged    = "S",
              conflict  = "!",
            }
          }
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
          },
          -- Add this to exclude from fuzzy finder
          find_command = "fd",
          find_args = {
            fd = {
              "--exclude", "node_modules",
              "--exclude", ".git",
            }
          },
        },
      })
    end,
  },

  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
}
