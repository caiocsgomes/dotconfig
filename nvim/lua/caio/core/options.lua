local opt = vim.opt -- for conciseness

-- line numbers -> this will show the number line and also the numbers of lines relative to the current one
opt.relativenumber = true
opt.number = true


-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true


-- line wrapping
opt.wrap = false

-- search settings -> cases will be ignored on case
opt.ignorecase = true
opt.smartcase = true


-- cursor line -> shows a line for current cursor
opt.cursorline = true

-- apearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"


-- backspace
opt.backspace = "indent,eol,start"

-- clipboard -> this will make copy and paste to use the clipboard
opt.clipboard:append("unnamedplus")

-- split windows -> this will give directions for when splitting the window
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- Disable swap
opt.swapfile = false

