return {
	{
		-- Plugin to bridge between external LSP and neovim
		"williamboman/mason.nvim",
	},
	{
		-- Plugin to manage the LSP through mason
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"cssls",
				"dockerls",
				"gopls",
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
		-- Troubleshooting: LspInfo
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
				auto_start = true, -- if you want to start COQ at startup
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
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})
		end,
	},
}
