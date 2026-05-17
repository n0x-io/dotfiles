return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")

      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        win = {
          border = "rounded",
          position = "bottom",
          margin = { 1, 0, 1, 0 },
          padding = { 2, 2, 2, 2 },
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 3,
          align = "left",
        },
      })

      -- Register leader key mappings with descriptions
      wk.add({
        { "<leader>e", desc = "Toggle File Explorer" },
        { "<leader>q", desc = "Close Buffer" },
        { "<leader>w", desc = "Toggle Whitespace" },
        { "<leader>f", desc = "Find Files" },
        { "<leader>rn", desc = "LSP Rename" },
        { "<leader>a", desc = "Code Actions (Rust)" },
        { "<leader><leader>f", desc = "Format Code" },
      })

      -- Register LSP mappings (global, not buffer-specific)
      wk.add({
        { "gD", desc = "Go to Declaration" },
        { "gd", desc = "Go to Definition" },
        { "gi", desc = "Go to Implementation" },
        { "gr", desc = "Find References" },
        { "K", desc = "Hover Documentation" },
      })

      -- Register German keyboard specific mappings
      wk.add({
        { "ü", desc = "Jump to previous paragraph {" },
        { "+", desc = "Jump to next paragraph }" },
      })

      -- Register buffer navigation
      wk.add({
        { "<S-h>", desc = "Previous Buffer" },
        { "<S-l>", desc = "Next Buffer" },
      })

      -- Register Telescope
      wk.add({
        { "<c-t>", desc = "Live Grep" },
      })

      -- Register Floaterm
      wk.add({
        { "<F7>", desc = "New Float Terminal" },
        { "<F8>", desc = "Previous Float Terminal" },
        { "<F9>", desc = "Next Float Terminal" },
        { "<F12>", desc = "Toggle Float Terminal" },
      })
    end,
  },
}
