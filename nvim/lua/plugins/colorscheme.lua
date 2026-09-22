-- Colorscheme configuration
-- Current: Gruvbox Dark, hard contrast (background #1d2021)
--
-- Ghostty uses the "Gruvbox Dark" theme (background #282828). Nvim uses the
-- hard variant. Both use the same palette, but the nvim pane is darker. This
-- shows the border between the terminal and the editor.
--
-- To switch to a different colorscheme:
--   1. Add the plugin spec for your chosen theme
--   2. Set the LazyVim colorscheme option below
--
-- Popular alternatives:
--   - tokyonight: { "folke/tokyonight.nvim" }
--   - rose-pine: { "rose-pine/neovim", name = "rose-pine" }
--   - catppuccin: { "catppuccin/nvim", name = "catppuccin" }

return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard", -- background #1d2021
      -- Uncomment to enable transparent background
      -- transparent_mode = true,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
