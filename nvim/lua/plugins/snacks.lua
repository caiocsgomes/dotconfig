return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = false, -- for hidden files
        ignored = false, -- for .gitignore files
      },
      files = { hidden = true },
      dashboard = {
        enabled = false,
      },
    },
  },
}
