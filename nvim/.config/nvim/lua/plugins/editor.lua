return {
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup{}
    end,
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn                        = true,
        numhl                             = false,
        linehl                            = false,
        word_diff                         = false,
        watch_gitdir                      = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked               = true,
        current_line_blame                = false,
        current_line_blame_opts           = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
          ignore_whitespace = false,
        },
        sign_priority                     = 6,
        update_debounce                   = 100,
        status_formatter                  = nil,
        max_file_length                   = 40000,
        preview_config                    = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      }
    end,
  },

  -- Floating terminal
  {
    "voldikss/vim-floaterm",
  },

  -- VimWiki
  {
    "vimwiki/vimwiki",
    branch = "dev",
  },

  -- Discord presence
  {
    "andweeb/presence.nvim",
  },

  -- LaTeX support
  {
    "lervag/vimtex",
  },

  -- Better buffer closing
  {
    "moll/vim-bbye",
  },
}
