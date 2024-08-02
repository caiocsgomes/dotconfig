return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },

    -- stylua: ignore
    keys = {
      { "<F5>",       function() require("dap").continue() end,          desc = "Continue" },
      { "<F8>",       function() require("dap").step_into() end,         desc = "Step Into" },
      { "<F9>",       function() require("dap").step_over() end,         desc = "Step Over" },
      { "<F7>",       function() require("dap").step_out() end,          desc = "Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dt", function() require("dap").terminate() end,         desc = "Terminate" },
      { "<leader>dg", function() require("dap").goto_() end,             desc = "Go to Line (No Execute)" },
      { "<leader>dj", function() require("dap").down() end,              desc = "Down" },
      { "<leader>dk", function() require("dap").up() end,                desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end,          desc = "Run Last" },
      -- { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
      -- { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      -- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
      -- { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      -- { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      -- { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      -- { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      -- { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
    config = function()
      local dap = require("dap")
      dap.adapters.python = function(cb, config)
        if config.request == "attach" then
          ---@diagnostic disable-next-line: undefined-field
          local port = (config.connect or config).port
          ---@diagnostic disable-next-line: undefined-field
          local host = (config.connect or config).host or "127.0.0.1"
          cb({
            type = "server",
            port = assert(port, "`connect.port` is required for a python `attach` configuration"),
            host = host,
            options = {
              source_filetype = "python",
            },
          })
        else
          cb({
            type = "executable",
            command = "/Library/Frameworks/Python.framework/Versions/3.12/bin/python3",
            args = { "-m", "debugpy.adapter" },
            options = {
              source_filetype = "python",
            },
          })
        end
      end
      dap.configurations.python = {
        {
          -- The first three options are required by nvim-dap
          type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
          request = "launch",
          name = "Launch file",

          -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

          program = "${file}", -- This configuration will launch the current file if used.
          pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
              return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
              return cwd .. "/.venv/bin/python"
            else
              print("You need to create a virtual environment called venv or .venv")
            end
          end,
        },
      }
      dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
          -- add this if on windows, otherwise server won't open successfully
          -- detached = false
        },
      }
      -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "launch",
          program = "./${relativeFileDirname}",
        },
        {
        	type = "delve",
        	name = "Debug test", -- configuration for debugging test files
        	request = "launch",
        	mode = "test",
        	program = "${file}",
        },
        -- works with go.mod packages and sub packages
        {
        	type = "delve",
        	name = "Debug test (go.mod)",
        	request = "launch",
        	mode = "test",
        	program = "./${relativeFileDirname}",
        },
      }
    end,
  },
  -- {
  -- 	"mfussenegger/nvim-dap-python",
  -- },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    -- stylua: ignore
    keys = {
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
      -- { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
    },
    opts = {
      layouts = {
        {
          elements = {
            { id = "scopes",  size = 0.33 },
            { id = "watches", size = 0.33 },
            { id = "repl",    size = 0.34 },
          },
          size = 10,
          position = "bottom", -- Position the windows at the bottom
        },
      },
      controls = {
        enabled = false, -- Disable the controls element
      },
      floating = {
        max_height = nil,  -- These can be integers or a float between 0 and 1.
        max_width = nil,   -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
    },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      -- 	-- dapui.close({})
      --      -- dap.clear_breakpoints()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      -- 	dapui.close({})
      -- end
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" }) -- Default looks better
      vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" }) -- Default looks better
    end,
  },
}
