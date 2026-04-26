return {
  {
    "folke/snacks.nvim",
    dependencies = { "amansingh-afk/milli.nvim" },
    opts = function()
      local splash = require("milli").load({ splash = "blackhole" })
      return {
        explorer = {
          enabled = false,
        },
        picker = {
          hidden = false, -- for hidden files
          ignored = false, -- for .gitignore files
        },
        files = { hidden = true },
        dashboard = {
          enabled = true,
          preset = {
            header = table.concat(splash.frames[1], "\n"),
          },
          sections = {
            { section = "header", padding = 1 },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
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
      }
    end,
    config = function(_, opts)
      require("snacks").setup(opts)
      require("milli").snacks({ splash = "blackhole", loop = true })
    end,
  },
}
