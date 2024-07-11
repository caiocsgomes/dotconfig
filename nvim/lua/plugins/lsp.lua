return {
	{
		-- Plugin to manage the LSP through mason
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"cssls",
				"dockerls",
				"delve",
				"gopls",
				"goimports",
				"gofumpt",
				"gomodifytags",
				"impl",
				"html",
				"jsonls",
				"pyright",
				"tsserver",
				"vimls",
				"yamlls",
				"terraformls",
			},
		},
	},
	{
		-- Troubleshooting: LspInfo, LspLog
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"mason.nvim",
			{ "williamboman/mason-lspconfig.nvim", config = function() end },

			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = false, -- if you want to start COQ at startup
				-- Your COQ settings here
			}
		end,
		config = function()
			local lspconfig = require("lspconfig")
			local lsp_defaults = lspconfig.util.default_config
			lspconfig.lua_ls.setup({})
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
			lspconfig.pyright.setup({})
		end,
	},
}
