require("mason").setup()

local ok, registry = pcall(require, "mason-registry")
if not ok then
	print("Module mason-registry had an error loading")
end

-- https://github.com/mason-org/mason-registry/tree/2024-03-09-abrupt-vest/packages
registry.refresh(function()
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
		"terraform-ls"
	)
end)

-- This will setup each LSP installed with Mason
-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#default-configuration
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ansiblels",
		"bashls",
		"dockerls",
		"docker_compose_language_service",
		"gopls",
		"jsonls",
		"marksman",
		"jedi_language_server",
		"terraformls",
	},
})

-- Advertising auto completion to lsp
local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- Setting up lsps
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

lspconfig.gopls.setup({
	cmd = { "gopls", "serve" },
	root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
	filetypes = { "go", "gomod" },
	on_attach = lsp_defaults.on_attach,
	capabilities = lsp_defaults.capabilities,
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
		},
	},
})
lspconfig.dockerls.setup({})
lspconfig.ansiblels.setup({})
lspconfig.terraformls.setup({})
lspconfig.jedi_language_server.setup({})
lspconfig.bashls.setup({})
lspconfig.docker_compose_language_service.setup({})
lspconfig.jsonls.setup({})
lspconfig.marksman.setup({}) -- Markdown

-- Setting up keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
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
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
