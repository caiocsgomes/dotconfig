return {
	{
		-- Plugin to manage the LSP through mason
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
					"bashls",
					"dockerls",
					"gopls",
					"pyright",
					"vimls",
					"yamlls",
					"terraformls",
				},
			})
		end,
	},
	{
		-- Troubleshooting: LspInfo, LspLog
		"neovim/nvim-lspconfig",
		lazy = false,
		-- dependencies = {
		-- 	"mason.nvim",
		-- 	{ "williamboman/mason-lspconfig.nvim", config = function() end },
		--
		-- 	{ "ms-jpq/coq_nvim", branch = "coq" },
		-- 	{ "ms-jpq/coq.artifacts", branch = "artifacts" },
		-- 	{ "ms-jpq/coq.thirdparty", branch = "3p" },
		-- },
		-- init = function()
		-- 	vim.g.coq_settings = {
		-- 		auto_start = false, -- if you want to start COQ at startup
		-- 		-- Your COQ settings here
		-- 	}
		-- end,
		config = function()
			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
			local lspconfig = require("lspconfig")
			local lsp_defaults = lspconfig.util.default_config
			lspconfig.bashls.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.vimls.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.terraformls.setup({})
			lspconfig.gopls.setup({
				cmd = { "gopls", "serve" },
				root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
				filetypes = { "go", "gomod" },
				on_attach = lsp_defaults.on_attach,
				capabilities = lsp_defaults.capabilities,
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						analyses = {
							fieldalignment = true,
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
						semanticTokens = true,
					},
					completeUnimported = true,
					usePlaceholders = true,
					staticcheck = true,
					gofumpt = true,
				},
			})
		end,
	},
}
