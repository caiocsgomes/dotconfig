return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup({
			ensure_installed = {
				-- https://mason-registry.dev/registry/list
				-- :MasonInstall <toolname> -- In case :Mason shows a missing lsp, dap, etc
				"black",
				"delve",
				"debugpy",
				"isort",
				"stylua",
			},
		})
	end,
}
