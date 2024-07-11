return {
	{
		-- Plugin to bridge between external LSP and neovim
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"debugpy",
				"delve",
				"black",
				"isort",
				"stylua",
			},
		},
	},
}
