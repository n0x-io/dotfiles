-- Cursor Dark.
--
-- Cursor's default theme is VS Code Dark Modern lineage, so vscode.nvim already
-- ships the exact token colors (#569CD6 keywords, #CE9178 strings, #6A9955
-- comments, #4EC9B0 types). Only the chrome and the :terminal palette need
-- pinning so Neovim matches kitty/tmux/fish.
return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"

      require("vscode").setup({
        -- The editor background is pinned to kitty's #181818 instead of Cursor's
        -- #1F1F1F: kitty only leaves a cell transparent when it uses the default
        -- background, so matching it keeps background_opacity working in nvim.
        color_overrides = {
          vscBack = "#181818",
          vscTabCurrent = "#1F1F1F",
          vscTabOther = "#181818",
          vscTabOutside = "#181818",
          vscLeftDark = "#181818",
        },
      })

      vim.cmd.colorscheme("vscode")

      -- :terminal gets the same 16 colors as kitty and tmux. vscode.nvim would
      -- otherwise map them onto the syntax palette, which makes green the
      -- comment green (#6A9955) and looks nothing like the shell.
      local palette = {
        [0] = "#000000", "#cd3131", "#0dbc79", "#e5e510",
        "#2472c8", "#bc3fbc", "#11a8cd", "#e5e5e5",
        "#666666", "#f14c4c", "#23d18b", "#f5f543",
        "#3b8eea", "#d670d6", "#29b8db", "#e5e5e5",
      }
      for i, color in pairs(palette) do
        vim.g["terminal_color_" .. i] = color
      end
    end,
  },
}
