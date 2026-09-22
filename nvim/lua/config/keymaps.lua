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
-- Saving and Quitting
-- ============================================================================
-- Save every modified buffer, not only the current one.
-- The LazyVim default <C-s> maps to :w, which writes the current buffer only.
keymap.set("n", "<leader>W", "<cmd>wa<cr>", { desc = "Save all files" })

-- Save all files, then quit without a prompt.
-- LazyVim maps <leader>qq to :qa, which asks about terminals and scratch buffers.
keymap.set("n", "<leader>qq", "<cmd>silent! wa<cr><cmd>qa!<cr>", { desc = "Save all and quit" })

-- ============================================================================
-- Line Editing Shortcuts
-- ============================================================================
-- Add punctuation to end of line without moving cursor
keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "Add comma to end of line" })
keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "Add semicolon to end of line" })

-- ============================================================================
-- Clipboard Operations
-- ============================================================================
-- Yank to system clipboard. options.lua sets clipboard = "", so plain y stays local.
keymap.set("v", "<leader>y", [["+y]], { desc = "Yank to system clipboard" })

-- <leader>y is the system-clipboard yank operator in normal mode.
-- It accepts any motion, text object, or count: <leader>yw, <leader>yi", <leader>y2j.
-- The mapping reads the next key with getcharstr instead of relying on more
-- <leader>y... mappings. Extra mappings would make <leader>y ambiguous, and
-- Neovim would wait for timeoutlen before it decided which one you meant.
-- Two keys are not motions, so they keep their own meaning:
--   p -> copy the path relative to the CWD
--   P -> copy the absolute path
keymap.set("n", "<leader>y", function()
  local ok, key = pcall(vim.fn.getcharstr)
  -- Abort on <Esc>, <C-c>, or an interrupt.
  if not ok or key == "" or key == "\27" or key == "\3" then
    return ""
  end

  if key == "p" or key == "P" then
    -- vim.notify can open a window. Defer it, because an expr mapping holds textlock.
    vim.schedule(function()
      local path = key == "P" and vim.fn.expand("%:p") or vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
      vim.fn.setreg("+", path)
      vim.notify("Copied path: " .. path)
    end)
    return ""
  end

  -- Feed the key back. Neovim waits for the rest of an incomplete motion,
  -- so <leader>yi then " completes as "+yi".
  return [["+y]] .. key
end, { expr = true, desc = "Yank to system clipboard (motion)" })

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

-- Path copying lives in the <leader>y operator above. See <leader>yp and <leader>yP.
