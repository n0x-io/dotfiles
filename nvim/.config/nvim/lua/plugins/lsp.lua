return {
  -- Mason: LSP installer
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
          },
        },
      })
    end,
  },

  -- Mason LSP Config bridge
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()

      -- Setup LSP servers using vim.lsp.config (new API)
      vim.lsp.config('clangd', {})
      vim.lsp.config('pylsp', {})
    end,
  },
}
