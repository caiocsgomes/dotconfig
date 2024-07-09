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
		dependencies = {
			"mason.nvim",
			{ "williamboman/mason-lspconfig.nvim", config = function() end },
		},
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
