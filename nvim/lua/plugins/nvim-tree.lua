return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local function nvim_tree_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "<C-h>", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "<Esc>", "<cmd>NvimTreeToggle<cr>", opts("Open: Horizontal Split"))
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
	end,
}
