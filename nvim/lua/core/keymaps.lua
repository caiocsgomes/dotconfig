vim.g.mapleader = " "
local keymap = vim.keymap

--general
keymap.set("i", "jk", "<ESC>", { desc = "ESC to enter normal mode" })
keymap.set("n", "<leader>o", "o<ESC>k", { desc = "insert line below" })
keymap.set("n", "<leader>hh", ":nohl<CR>", { desc = "hide highlight" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "increase number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "decrease number" })
keymap.set("n", "<Tab>", "<C-w>w", { desc = "switch between windows" })
-- keymap.set("n", "<C-v>", "<C-w>v", { desc = "open vertical tab" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "write file" })
keymap.set("n", "<leader>q", ":q!<CR>", { desc = "quit without saving" })
keymap.set("n", "tn", "<cmd>tabnew<CR>", { desc = "quit without saving" })
keymap.set("n", "<leader>n", "<cmd>bn<CR>")
keymap.set("n", "<leader>b", "<cmd>bp<CR>")
keymap.set("n", "<leader>cp", "<cmd>let @+ = expand('%:p:h') | echo 'Current working directory copied to clipboard!'<CR>", { desc = "copy cwd to clipboard"})

-- fzf-lua
keymap.set("n", "<leader>ff", function() require('fzf-lua').files() end, { desc = "Fzf Files" })
keymap.set("n", "<leader>fs", function() require('fzf-lua').grep_visual() end, { desc = "Fzf String" })
keymap.set("n", "<leader>fr", "<cmd>FzfLua registers<cr>", { desc = "Fzf Registers" })
keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Fzf Help Tags" })
keymap.set("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", { desc = "Fzf Key Maps" })
keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Fzf Buffers" })

-- resize windows
keymap.set("n", "<leader>=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
keymap.set("n", "<leader>-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically

-- todo comments
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")

-- lazy git
keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>")

-- fugitive -- https://github.com/tpope/vim-fugitive
keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<cr>")
keymap.set("n", "<leader>gr", "<cmd>Gread<cr>")
keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>")
-- keymap.set("n", "<leader>gv", "<cmd>GBrowse<cr>")

-- registers
keymap.set({ "n", "v", "x" }, "<leader>p", '"+', { noremap = true, silent = true, desc = "Paste clipboard" })
keymap.set({ "n", "v", "x" }, "<leader>y", '"0p', { noremap = true, silent = true, desc = "Paste yank register" })
keymap.set({ "n", "v", "x" }, "<leader>d", '"1p', { noremap = true, silent = true, desc = "Paste delete register" })
keymap.set({ "n", "v", "x" }, "<C-a>", "gg0vG$", { noremap = true, silent = true, desc = "Select all" })

-- Telekasken
keymap.set(
  { "n" },
  "<leader>nn",
  "<cmd>Telekasten find_notes<cr>",
  { noremap = true, silent = true, desc = "Open Telekasken" }
)

--mini files
keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>")

