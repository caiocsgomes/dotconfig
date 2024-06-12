vim.g.mapleader = " "

local keymap = vim.keymap

--keymap.set("MODE", "KEYS", "ACTION")

--general
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>o", "o<ESC>k")
keymap.set("n", "<leader>nh", ":nohl<CR>") -- no highlights

--keymap.set("n","x","_x") -- delete but not add to the register
keymap.set("n", "<leader>+", "<C-a>") -- increase number with leader +
keymap.set("n", "<leader>-", "<C-x>") -- decrease number with leader -

---- Insert mode
keymap.set("n", "<leader>ww", ":w<CR>")
keymap.set("n", "<leader>wq", ":wq<CR>")
keymap.set("n", "<leader>qq", ":q!<CR>")

-- nvim filetree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- nvim tree
keymap.set("n", "<Tab>", "<C-w>w")
-- keymap.set("n", "<Tab>" ,"<C-w>w", {noremap = true, silent = true})

-- resize windows
keymap.set("n", "<leader>=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
keymap.set("n", "<leader>-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically

-- format on command
keymap.set("n", "<leader>cc", "<cmd>Format<cr>")

-- todo comments
keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>")

-- lazy git
keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>")
