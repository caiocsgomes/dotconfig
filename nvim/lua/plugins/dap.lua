-- local arrows = require('icons').arrows
return {
  "mfussenegger/nvim-dap",
  recommended = true,
  desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      opts = {
        -- icons = {
        -- 	collapsed = arrows.right,
        -- 	current_frame = arrows.right,
        -- 	expanded = arrows.down,
        -- },
        floating = { border = "rounded" },
        layouts = {
          {
            elements = {
              { id = "stacks",      size = 0.30 },
              { id = "breakpoints", size = 0.20 },
              { id = "scopes",      size = 0.50 },
            },
            position = "right",
            size = 60,
          },
        },
      },
      keys = {
        {
          "<leader>de",
          function()
            require("dapui").eval()
          end,
          desc = "Eval",
          mode = { "n", "v" },
        },
      },
    },
    -- Virtual text.
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = { virt_text_pos = "eol" },
    },
    { "nvim-neotest/nvim-nio" },
  },
  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    {
      "<F8>",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<F9>",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<F7>",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
        require('dapui').close({})
        require('dap').clear_breakpoints()
      end,
      desc = "Terminate",
    },
    {
      "<leader>dg",
      function()
        require("dap").goto_()
      end,
      desc = "Go to Line (No Execute)",
    },
    {
      "<leader>dj",
      function()
        require("dap").down()
      end,
      desc = "Down",
    },
    {
      "<leader>dk",
      function()
        require("dap").up()
      end,
      desc = "Up",
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.open()
      end,
      desc = "open repl",
    },
  },
  config = function()
    local dapui = require("dapui")
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
          command = "/usr/bin/python3",
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
        args = {
          "dap",
          "--headless",
          "--log=false",
          "-l",
          "127.0.0.1:${port}",
          "2>&1 | grep -v '\\[debug-adapter stdout\\]'",
        },
      },
    }
    dap.adapters["local-lua"] = {
      type = "executable",
      command = "node",
      args = {
        os.getenv('HOME') .. '/local-lua-debugger-vscode/extension/debugAdapter.js'
      },
      enrich_config = function(config, on_config)
        if not config["extensionPath"] then
          local c = vim.deepcopy(config)
          -- 💀 If this is missing or wrong you'll see
          -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
          c.extensionPath = os.getenv('HOME') .. '/local-lua-debugger-vscode/'
          on_config(c)
        else
          on_config(config)
        end
      end,
    }
    dap.configurations.lua = {
      {
        name = 'Current file (local-lua-dbg, lua)',
        type = 'local-lua',
        request = 'launch',
        cwd = '${workspaceFolder}',
        program = {
          lua = 'lua5.4',
          file = '${file}',
        },
        args = {},
      },
    }
    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    -- dap.configurations.go = {
    -- 	{
    -- 		type = "delve",
    -- 		name = "Debug",
    -- 		request = "launch",
    -- 		program = "./${relativeFileDirname}",
    -- 	},
    -- 	{
    -- 		type = "delve",
    -- 		name = "Debug test", -- configuration for debugging test files
    -- 		request = "launch",
    -- 		mode = "test",
    -- 		program = "${file}",
    -- 	},
    -- 	-- works with go.mod packages and sub packages
    -- 	{
    -- 		type = "delve",
    -- 		name = "Debug test (go.mod)",
    -- 		request = "launch",
    -- 		mode = "test",
    -- 		program = "./${relativeFileDirname}",
    -- 	},
    -- }

    dap.adapters.go = {
      type = 'executable',
      command = 'node',
      args = { os.getenv('HOME') .. '/vscode-go/extension/dist/debugAdapter.js' },
    }
    dap.configurations.go = {
      {
        type = 'go',
        name = 'Debug',
        request = 'launch',
        showLog = false,
        program = "${file}",
        dlvToolPath = vim.fn.exepath('dlv'), -- Adjust to where delve is installed
        args = { '--build-flags', '-gcflags=all=-N -l' },
      },
    }
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    local types_enabled = true
    dapui.toggle_types = function()
      types_enabled = not types_enabled
      dapui.update_render({ max_type_length = types_enabled and -1 or 0 })
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
      dap.clear_breakpoints()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" }) -- Default looks better
    vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" }) -- Default looks better
  end,
}
