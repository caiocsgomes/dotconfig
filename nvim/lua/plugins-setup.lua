-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- all above came from the docs and from https://www.youtube.com/watch?v=vdn_pKJUda8&t=2s
	-- packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- theme
	-- use("rebelot/kanagawa.nvim")
	use("ellisonleao/gruvbox.nvim")

	-- commenting with gcc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	--icons
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update =
				require("nvim-treesitter.install").update({ with_sync = true, highlight = { enable = true } })
			ts_update()
		end,
	})
	-- autocompletion
	use({
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
	})
	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("mason-org/mason-registry")
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	use("neovim/nvim-lspconfig") -- easily configure language servers

	-- formatting & linting
	-- use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	-- use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	--
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- copilot (needs to run :Copilot setup manually :( as specified in the docs
	use("github/copilot.vim")

	-- wakatime
	use("wakatime/vim-wakatime")

	-- todo-comments
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
		cmd = { "TodoTelescope" },
	})

	-- lazygit
	-- nvim v0.7.2
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

  -- nvim-dap
  use("mfussenegger/nvim-dap")
  use("leoluz/nvim-dap-go")
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	-- all below came from the docs
	if packer_bootstrap then
		require("packer").sync()
	end
end)
