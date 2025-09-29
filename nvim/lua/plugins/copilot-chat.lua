return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = {
      {
        "<leader>am",
        function()
          require("CopilotChat").select_model()
        end,
        desc = "Choose Model (CopilotChat)",
        mode = { "n", "v" },
      },
    },
    opts = {
      completion = { enabled = false },
    },
  },
}
