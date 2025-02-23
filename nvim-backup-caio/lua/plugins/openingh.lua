return {
  {
    "almo7aya/openingh.nvim",
    config = function()
      require("openingh").setup({
        -- Optional configuration options
      })
    end,
    keys = {
      { "<leader>go", "<cmd>OpenInGHFile<CR>", desc = "Open file in GitHub" },
      { "<leader>gb", "<cmd>OpenInGHRepo<CR>", desc = "Open repository in GitHub" },
    },
  },
}
