-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
-- File explorer
local setup, _ = pcall(require, "nvim-tree")
if not setup then
	return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- This function came from the docs: https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file#custom-mappings
-- To view mappings search from *nvim-tree-mappings-default* tag in the docs
local function nvim_tree_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<C-r>", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "<C-d>", api.node.open.horizontal, opts("Open: Horizontal Split"))
end

require("nvim-tree").setup({
	on_attach = nvim_tree_on_attach,
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = "20%",
		relativenumber = true,
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
			quit_on_open = true,
			window_picker = {
				enable = true,
			},
		},
	},
})
