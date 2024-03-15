require("mason").setup()

local registry = require("mason-registry")
-- https://github.com/mason-org/mason-registry/tree/2024-03-09-abrupt-vest/packages
registry.refresh(function ()
     registry.get_package(
     "lua-language-server",
     "ansible-language-server",
     "bash-language-server",
     "dockerfile-language-server",
     "docker-compose-language-service",
     "gopls",
     "json-lsp",
     "marksman",
     "jedi-language-server",
     "hydra-lsp",
     "terraform-ls")
end)

-- This will setup each LSP installed with Mason
-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#default-configuration
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls",  "ansiblels", "bashls", "dockerls", "docker_compose_language_service", "gopls", "jsonls", "marksman", "jedi_language_server", "hydra_lsp", "terraformls" }
})

-- Advertising auto completion to lsp
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Setting up lsps
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

lspconfig.gopls.setup({})
lspconfig.dockerls.setup({})
lspconfig.ansiblels.setup({})
lspconfig.terraformls.setup({})

-- Setting up keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

---- Formatting


-- import null-ls plugin safely
-- local setup, null_ls = pcall(require, "null-ls")
-- if not setup then
--   return
-- end
--
-- -- for conciseness
-- local formatting = null_ls.builtins.formatting -- to setup formatters
-- local diagnostics = null_ls.builtins.diagnostics -- to setup linters
--
-- -- to setup format on save
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- -- configure null_ls
-- null_ls.setup({
--   -- setup formatters & linters
--   sources = {
--     --  to disable file types use
--     diagnostics.terraform_validate,
--     formatting.stylua, -- lua formatter
--     formatting.goimports_reviser,
--   },
--   -- configure format on save
--   on_attach = function(current_client, bufnr)
--     if current_client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           -- vim.lsp.buf.format({
--           --   filter = function(client)
--           --     --  only use null-ls for formatting instead of lsp server
--           --     return client.name == "null-ls"
--           --   end,
--           --   bufnr = bufnr,
--           -- })
--           vim.lsp.buf.formatting_sync()
--         end,
--       })
--     end
--   end,
-- })
