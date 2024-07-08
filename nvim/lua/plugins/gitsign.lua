-- import gitsigns plugin safely
return {
	"lewis6991/gitsigns.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("gitsigns").setup()
	end,
}
