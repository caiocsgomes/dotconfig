-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
-- import nvim-tree plugin safely
local setup, _ = pcall(require, "nvim-tree")
if not setup then
	return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = "20%",
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	update_focused_file = {
		enable = true,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
