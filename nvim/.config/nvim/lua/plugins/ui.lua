return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local nvimtree = require("nvim-tree")
      nvimtree.setup {
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end
          api.config.mappings.default_on_attach(bufnr)
          vim.keymap.set("n", "<space>", api.node.open.edit, opts("Open"))
        end,
        renderer = {
          icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                deleted = "",
                untracked = "U",
                ignored = "◌",
              },
              folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
              },
            },
          },
          highlight_git = true,
          root_folder_modifier = ":t",
          indent_markers = {
            enable = true,
          },
        },
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = false,
        update_cwd = true,
        diagnostics = {
          enable = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
          ignore_list = {},
        },
        system_open = {
          cmd = nil,
          args = {},
        },
        filters = {
          dotfiles = false,
          custom = {},
        },
        git = {
          enable = true,
          ignore = true,
          timeout = 500,
        },
        view = {
          width = 35,
          side = "left",
          float = {
            quit_on_focus_loss = true,
          },
        },
        trash = {
          cmd = "trash",
          require_confirm = true,
        },
        actions = {
          open_file = {
            resize_window = true,
            quit_on_open = false,
            window_picker = {
              enable = false,
            },
          },
        },
      }
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "neanias/everforest-nvim" },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'everforest',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        }
      }
    end,
  },

  -- Buffer line
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup {
        options = {
          mode = "buffers",
          style_preset = bufferline.style_preset.default,
          themable = true,
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = {
            icon = '▎',
            style = 'icon',
          },
          buffer_close_icon = '󰅖',
          modified_icon = '● ',
          close_icon = ' ',
          left_trunc_marker = ' ',
          right_trunc_marker = ' ',
          max_name_length = 30,
          max_prefix_length = 30,
          truncate_names = true,
          tab_size = 25,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_update_on_event = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true
            }
          },
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true,
          duplicates_across_groups = true,
          persist_buffer_sort = true,
          move_wraps_at_ends = false,
          separator_style = "thin",
          enforce_regular_tabs = true,
          always_show_bufferline = true,
          auto_toggle_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
          sort_by = 'insert_after_current',
        }
      }
    end,
  },

  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('dashboard').setup {}
    end,
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons" },
}
