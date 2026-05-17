return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup {
        ensure_installed = { "bash", "c", "cpp", "javascript", "json", "python", "css", "rust", "lua", "markdown", "markdown_inline" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      }
    end,
  },
}
