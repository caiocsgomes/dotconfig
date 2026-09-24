return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = false,
      },
      picker = {
        hidden = true, -- for hidden files
        ignored = false, -- for .gitignore files
      },
      dashboard = {
        enabled = false,
      },
        terminal = {
          win = {
            wo = {
              winblend = 0,
              foldmethod = "manual",
              foldcolumn = "0",
              foldlevel = 99,
              number = false,
              relativenumber = false,
              signcolumn = "no",
              statuscolumn = "",
              cursorline = false,
              cursorcolumn = false,
              spell = false,
              list = false,
              conceallevel = 0,
              winhighlight = "Normal:Normal",
            },
          },
        },
        lazygit = {
          win = {
            wo = {
              winblend = 0,
              foldmethod = "manual",
              foldcolumn = "0",
              foldlevel = 99,
              number = false,
              relativenumber = false,
              signcolumn = "no",
              statuscolumn = "",
              cursorline = false,
              cursorcolumn = false,
              spell = false,
              list = false,
              conceallevel = 0,
              winhighlight = "Normal:Normal",
            },
          },
        },
    },
  },
}
