return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<F5>", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<F7>", function() require("dap").step_out() end, desc = "Step Out" },
    { "<F8>", function() require("dap").step_over() end, desc = "Step Over" },
    { "<F9>", function() require("dap").step_into() end, desc = "Step Into" },
  }
}
