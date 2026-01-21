return {
  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "G",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GRename",
      "GDelete",
      "GBrowse",
    },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
      { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
      { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git pull" },
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff" },
      { "<leader>gr", "<cmd>diffget<cr>", desc = "Git discard changes (restore from git)" },
    },
  },
}
