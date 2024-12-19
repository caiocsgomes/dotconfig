return {
  {
    -- Plugin to manage the LSP through mason
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
          -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
          "bashls",
          "dockerls",
          "gopls",
          "pyright",
          "yamlls",
          "terraformls",
        },
      })
    end,
  },
  {
    -- Troubleshooting: LspInfo, LspLog
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    lazy = false,
    opts = {
      servers = {
        bashls = {},
        dockerls = {},
        pyright = {},
        vimls = {},
        yamlls = {},
        terraformls = {},
        lua_ls = {},
        gopls = {},
      },
    },
    config = function(_, opts)
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
      -- Setting up keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf, noremap = true, silent = true }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          -- vim.keymap.set("i", "<C-space>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })
    end,
  },
}
