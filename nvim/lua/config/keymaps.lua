-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- ============================================================================
-- Mode Switching
-- ============================================================================
-- Quick escape from insert mode using 'jk'
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Quick escape from terminal mode using 'jk'
keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- ============================================================================
-- Line Editing Shortcuts
-- ============================================================================
-- Add punctuation to end of line without moving cursor
keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "Add comma to end of line" })
keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "Add semicolon to end of line" })

-- ============================================================================
-- Clipboard Operations
-- ============================================================================
-- Yank to system clipboard (since we disabled default clipboard integration)
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })

-- ============================================================================
-- Smart End of Line
-- ============================================================================
-- Jump to end of line and auto-close any unclosed brackets/quotes
-- See lua/utils/smart-line.lua for implementation details
keymap.set("i", "<C-e>", function()
  local smart_line = require("utils.smart-line")
  return vim.api.nvim_replace_termcodes(smart_line.smart_end_of_line(), true, true, true)
end, { expr = true, desc = "Smart end of line with auto-close" })
-- ============================================================================
-- File Explorer
-- ============================================================================
-- Toggle MiniFiles explorer, revealing current file
keymap.set("n", "<leader>e", function()
  local MiniFiles = require("mini.files")
  local _ = MiniFiles.close() or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  vim.defer_fn(function()
    MiniFiles.reveal_cwd()
  end, 30)
end, { desc = "Toggle file explorer" })

-- ============================================================================
-- Path Copying
-- ============================================================================
-- Copy full absolute filepath to clipboard
keymap.set("n", "<leader>yP", function()
  local filepath = vim.fn.expand("%:p")
  vim.fn.setreg("+", filepath)
  vim.notify("Copied filepath: " .. filepath)
end, { desc = "Copy absolute filepath" })

-- Copy relative filepath (from CWD) to clipboard
keymap.set("n", "<leader>yp", function()
  local relpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  vim.fn.setreg("+", relpath)
  vim.notify("Copied path relative to CWD: " .. relpath)
end, { desc = "Copy relative filepath" })
