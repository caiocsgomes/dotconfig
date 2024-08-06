vim.g.mapleader = " "
local keymap = vim.keymap

--general
keymap.set("i", "jk", "<ESC>", { desc = "ESC to enter normal mode" })
keymap.set("n", "<leader>o", "o<ESC>k", { desc = "insert line below" })
keymap.set("n", "<leader>rh", ":nohl<CR>", { desc = "disable highlight" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "increase number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "decrease number" })
keymap.set("n", "<Tab>", "<C-w>w", { desc = "switch between windows" })
keymap.set("n", "<C-v>", "<C-w>v", { desc = "open vertical tab" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "write file" })
keymap.set("n", "<leader>q", ":q!<CR>", { desc = "quit without saving" })

-- nvim filetree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "toggle filetree" })

-- telescope
keymap.set(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<cr>",
  { desc = "find files within current working directory, respects .gitignore" }
)
keymap.set(
  "n",
  "<leader>fs",
  "<cmd>Telescope live_grep<cr>",
  { desc = "search for string in current working directory" }
)
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "search for string in current folder" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "list open buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "search for help tags" })
keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>")

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






  -- nvim dap
--keymap.set("n", "<leader>d", "<cmd>lua require('dapui').toggle()<cr>", { desc = "toggle dap ui" })
-- vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" }) -- Default looks better
-- vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" }) -- Default looks better
--keymap.set("n", "<F5>", require("dap").continue)
--keymap.set("n", "<F10>", require("dap").step_over)
--keymap.set("n", "<F11>", require("dap").step_into)
--keymap.set("n", "<F12>", require("dap").step_out)
--keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
