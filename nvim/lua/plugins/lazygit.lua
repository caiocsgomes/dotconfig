-- import gitsigns plugin safely
return {
	"kdheepak/lazygit.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
	},
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
  config = function()
    vim.g.lazygit_use_custom_config_file_path = 0
    vim.g.lazygit_config_file_path = "~/.config/nvim/lua/config/lazygit/config.yaml"
  end
}
