-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- ============================================================================
-- Line Numbers
-- ============================================================================
-- Show both absolute line number on current line and relative numbers on others
-- This helps with motion commands (e.g., "5j" to move 5 lines down)
opt.relativenumber = true
opt.number = true

-- ============================================================================
-- Tabs and Indentation
-- ============================================================================
-- Use 2 spaces for indentation (common in Lua, JS, TS, etc.)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- ============================================================================
-- Line Wrapping
-- ============================================================================
-- Disable line wrapping for better code readability
opt.wrap = false

-- ============================================================================
-- Clipboard
-- ============================================================================
-- Don't sync with system clipboard by default (yank keymaps handle this)
opt.clipboard = ""

-- ============================================================================
-- Language Server Configuration
-- ============================================================================
-- Python: Use basedpyright for type checking and ruff for linting/formatting
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

-- ============================================================================
-- Picker Configuration
-- ============================================================================
-- Use FZF as the default picker (faster and more familiar than Telescope for many users)
vim.g.lazyvim_picker = "fzf"
