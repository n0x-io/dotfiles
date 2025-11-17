return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", function()
              vim.cmd.RustLsp('hover', 'actions')
            end, { buffer = bufnr, desc = "Rust hover actions" })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", function()
              vim.cmd.RustLsp('codeAction')
            end, { buffer = bufnr, desc = "Rust code actions" })
          end,
        },
      }
    end,
  },
}
