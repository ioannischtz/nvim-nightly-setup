local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save / Quit
map("n", "<C-s>", "<cmd>update<cr>", { desc = "Save the current file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<C-Q>", "<cmd>q!<cr>", { desc = "Force quit" })

-- Quick source current file
map("n", "<leader>s", "<cmd>update | source %<cr>", { desc = "Update & source current file" })

-- Clear search highlight
map("n", "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Clear search highlight" })

-- System clipboard helpers
map({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Files
map("n", "<leader>n", ":enew<cr>", { desc = "Create new file" })
map("n", "<C-S>", ":wa<cr>", { desc = "Save all files" })

-- BUffers
map("n", "<leader>c", ":bd<cr>", { desc = "Close the current buffer" })
map("n", "<leader>C", ":bufdo :bd<cr>", { desc = "Close all buffers" })
-- map(
-- 	"n",
-- 	"leader>bc",
-- 	":bufdo if bufmr('%') !=bufnr('#') | bd | endif<cr>",
-- 	{ desc = "Close all buffers except the current one" }
-- )

-- Tabs
map("n", "<leader>tc", ":tabclose<cr>", { desc = "Close the current tab" })
map("n", "<leader>tl", ":tabnext<cr>", { desc = "Move to the next tab" })
map("n", "<leader>tc", ":tabprevious<cr>", { desc = "Move to the previous tab" })

-- Splits
map("n", "|", ":vsp<cr>", { desc = "Split right" })
map("n", "\\", ":sp<cr>", { desc = "Split down" })

-- Lines
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("i", "<A-j>", "<esc>:m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" })
map("v", "<A-k>", ":m '<-1<cr>gv=gv", { desc = "Move line up" })
map("i", "<A-k>", "<esc>:m .-2<cr>==", { desc = "Move line up" })
map("n", "<C-a>", "ggVG", { desc = "Select all lines" })

-- Comments
-- map("n", "<leader>/", "gcc", { desc = "Toggle Comment current line" })
-- map("x", "<leader>/", "gc", { desc = "Toggle Comment" })
-- map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Insert comment below current line" })
-- map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Insert comment above current line" })
