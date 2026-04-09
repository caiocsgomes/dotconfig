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

-- Optimize terminal buffer performance (fixes lazygit lag)
vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter", "BufEnter" }, {
  pattern = { "term://*", "snacks_terminal", "*lazygit*" },
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local buftype = vim.bo[buf].buftype

    -- Only apply to terminal buffers
    if buftype ~= "terminal" then
      return
    end

    -- Disable expensive window options
    vim.wo.foldmethod = "manual"
    vim.wo.foldexpr = "0"
    vim.wo.foldcolumn = "0"
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = "no"
    vim.wo.statuscolumn = ""
    vim.wo.cursorline = false
    vim.wo.cursorcolumn = false
    vim.wo.spell = false
    vim.wo.list = false
    vim.wo.wrap = false
    vim.wo.linebreak = false

    -- Disable buffer-local expensive options
    vim.bo[buf].undofile = false
    vim.bo[buf].swapfile = false

    -- Disable smear-cursor globally when in terminal
    local ok_smear, smear = pcall(require, "smear_cursor")
    if ok_smear then
      smear.enabled = false
    end

    -- Disable tiny-glimmer
    local ok_glimmer, glimmer = pcall(require, "tiny-glimmer")
    if ok_glimmer and glimmer.disable then
      glimmer.disable()
    end

    -- Disable hardtime in terminal buffers
    pcall(vim.cmd, "Hardtime disable")
  end,
})

-- Re-enable plugins when leaving terminal
vim.api.nvim_create_autocmd({ "TermLeave", "BufLeave" }, {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    if vim.bo[buf].buftype ~= "terminal" then
      return
    end

    -- Re-enable smear-cursor
    vim.defer_fn(function()
      local ok_smear, smear = pcall(require, "smear_cursor")
      if ok_smear then
        smear.enabled = true
      end
    end, 100)
  end,
})
