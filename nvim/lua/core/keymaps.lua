vim.g.mapleader = " "

local keymap = vim.keymap

                         --keymap.set("MODE", "KEYS", "ACTION")

--general
keymap.set("i", "jk", "<ESC>", { desc = "ESC to enter normal mode" })
keymap.set("n", "<leader>o", "o<ESC>k", { desc = "insert line below" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "disable highlight" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "increase number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "decrease number" })
keymap.set("n", "<Tab>", "<C-w>w", { desc = "switch between windows" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "write file" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "write and quit" })
keymap.set("n", "<leader>q", ":q!<CR>", { desc = "quit without saving" })

-- nvim filetree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "toggle filetree" })

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

-- format on command
keymap.set("n", "<leader>c", "<cmd>Format<cr>")

-- todo comments
keymap.set("n", "<leader>t", "<cmd>TodoTelescope<cr>")

-- lazy git
keymap.set("n", "<leader>g", "<cmd>LazyGit<cr>")

-- registers
keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
keymap.set({ "n", "v", "x" }, "<C-a>", "gg0vG$", { noremap = true, silent = true, desc = "Select all" })
keymap.set({ "n", "v", "x" }, "<leader>y", '"0p', { noremap = true, silent = true, desc = "Paste from yank register" })
keymap.set(
	{ "n", "v", "x" },
	"<leader>d",
	'"1p',
	{ noremap = true, silent = true, desc = "Paste from delete register" }
)

-- keymap.set(
-- 	"i",
-- 	"<C-p>",
-- 	"<C-r>+",
-- 	{ noremap = true, silent = true, desc = "Paste from clipboard from within insert mode" }
-- )
-- keymap.set(
-- 	"x",
-- 	"<leader>P",
-- 	'"_dP',
-- 	{ noremap = true, silent = true, desc = "Paste over selection without erasing unnamed register" }
-- )

-- nvim dap
-- vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
-- keymap.set("n", "<F5>", require("dap").continue)
-- keymap.set("n", "<F10>", require("dap").step_over)
-- keymap.set("n", "<F11>", require("dap").step_into)
-- keymap.set("n", "<F12>", require("dap").step_out)
-- keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
