-- Colorscheme configuration
-- Current: Tokyo Night theme (default LazyVim colorscheme)
--
-- To enable transparency, uncomment the opts section below
-- To switch to a different colorscheme:
--   1. Add the plugin spec for your chosen theme
--   2. Configure LazyVim to use it:
--      { "LazyVim/LazyVim", opts = { colorscheme = "your-theme-name" } }
--
-- Popular alternatives:
--   - rose-pine: { "rose-pine/neovim", name = "rose-pine" }
--   - gruvbox: { "ellisonleao/gruvbox.nvim" }
--   - catppuccin: { "catppuccin/nvim", name = "catppuccin" }

return {
  {
    "folke/tokyonight.nvim",
    -- Uncomment to enable transparent background
    -- opts = {
    --   transparent = true,
    --   styles = {
    --     sidebars = "transparent",
    --     floats = "transparent",
    --   },
    -- },
  },
}
