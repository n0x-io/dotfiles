return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup()

      local ensure = {
        "bash", "c", "cpp", "javascript", "json", "python",
        "css", "rust", "lua", "markdown", "markdown_inline",
        "php", "html", "terraform",
      }
      ts.install(ensure)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "bash", "sh", "c", "cpp", "javascript", "json", "python",
          "css", "rust", "lua", "markdown",
          "php", "html", "terraform",
        },
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
