return {
  "mfussenegger/nvim-dap-python",
  config = function()
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    require("dap-python").test_runner = "pytest"
  end,
}
