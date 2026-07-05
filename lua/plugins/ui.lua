return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        functions = { italic = true },
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme "tokyonight"
      vim.opt.background = "dark"

      local hl = function(thing, hl_opts)
        vim.api.nvim_set_hl(0, thing, hl_opts)
      end
      hl("SignColumn", { bg = "none" })
      hl("ColorColumn", { ctermbg = 0, bg = "#555555" })
      hl("CursorLineNR", { bg = "None" })
      hl("Normal", { bg = "none" })
      hl("LineNr", { fg = "#5eacd3" })
      hl("netrwDir", { fg = "#5eacd3" })
    end,
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        indicator = { style = "icon", icon = "▎" },
        diagnostics = "nvim_lsp",
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", text_align = "left" },
        },
        show_buffer_close_icons = true,
        show_close_icon = false,
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "id",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup {
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          width = 30,
          preserve_window_proportions = true,
        },
        renderer = {
          root_folder_label = false,
          highlight_git = true,
          indent_markers = { enable = true },
          icons = {
            glyphs = {
              default = "󰈚",
              symlink = "",
              folder = {
                default = "",
                empty = "",
                empty_open = "",
                open = "",
                symlink = "",
              },
              git = {
                unmerged = "",
                unstaged = "✗",
                staged = "✓",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "󰠠",
            info = "",
            warning = "",
            error = "",
          },
        },
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    "folke/which-key.nvim",
    lazy = false,
  },
}