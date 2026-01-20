-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Completely disable all diagnostics for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Completely disable diagnostics for the current buffer
    vim.diagnostic.disable(vim.api.nvim_get_current_buf())
  end,
})
