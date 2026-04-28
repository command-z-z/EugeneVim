vim.g.mapleader = " "

local opts = { silent = true, noremap = true }
local keymap = vim.keymap.set
-----------------------------------------------------------------------------
-- window
-------------------------------------------------------------------------------
keymap("n", "<leader>ws", "<cmd>split<CR><C-w>w", vim.tbl_extend("force", opts, { desc = "Split window horizontally" }))
keymap("n", "<leader>wv", "<cmd>vsplit<CR><C-w>w", vim.tbl_extend("force", opts, { desc = "Split window vertically" }))
keymap("n", "<leader>wh", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Move to left window" }))
keymap("n", "<leader>wk", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Move to upper window" }))
keymap("n", "<leader>wj", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Move to lower window" }))
keymap("n", "<leader>wl", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Move to right window" }))
keymap("n", "<M-left>", "<C-w><", vim.tbl_extend("force", opts, { desc = "Decrease window width" }))
keymap("n", "<M-right>", "<C-w>>", vim.tbl_extend("force", opts, { desc = "Increase window width" }))
keymap("n", "<M-up>", "<C-w>+", vim.tbl_extend("force", opts, { desc = "Increase window height" }))
keymap("n", "<M-down>", "<C-w>-", vim.tbl_extend("force", opts, { desc = "Decrease window height" }))
keymap("i", "<C-h>", "<Left>", vim.tbl_extend("force", opts, { desc = "Move cursor left" }))
keymap("i", "<C-j>", "<Down>", vim.tbl_extend("force", opts, { desc = "Move cursor down" }))
keymap("i", "<C-k>", "<Up>", vim.tbl_extend("force", opts, { desc = "Move cursor up" }))
keymap("i", "<C-l>", "<Right>", vim.tbl_extend("force", opts, { desc = "Move cursor right" }))
keymap("i", "<C-d>", "<Delete>", vim.tbl_extend("force", opts, { desc = "Delete next character" }))
keymap("i", "jk", "<Esc>", vim.tbl_extend("force", opts, { desc = "Exit insert mode" }))
keymap("n", "L", "$", vim.tbl_extend("force", opts, { desc = "Go to end of line" }))
keymap("n", "H", "^", vim.tbl_extend("force", opts, { desc = "Go to first non-blank character" }))
keymap("v", "L", "$", vim.tbl_extend("force", opts, { desc = "Select to end of line" }))
keymap("v", "H", "^", vim.tbl_extend("force", opts, { desc = "Select to first non-blank character" }))
keymap({ "n", "v", "o" }, "<C-j>", "5j", vim.tbl_extend("force", opts, { desc = "Move down 5 lines" }))
keymap({ "n", "v", "o" }, "<C-k>", "5k", vim.tbl_extend("force", opts, { desc = "Move up 5 lines" }))
keymap({ "n", "v", "o" }, "<C-h>", "5h", vim.tbl_extend("force", opts, { desc = "Move left 5 characters" }))
keymap({ "n", "v", "o" }, "<C-l>", "5l", vim.tbl_extend("force", opts, { desc = "Move right 5 characters" }))
keymap("n", "<C-s>", "<cmd>w<CR>", vim.tbl_extend("force", opts, { desc = "Save file" }))
keymap("i", "<C-s>", "<Esc><cmd>w<CR>", vim.tbl_extend("force", opts, { desc = "Save file" }))
keymap("n", "Q", "<cmd>q<CR>", vim.tbl_extend("force", opts, { desc = "Quit window" }))
keymap("n", "<C-a>", "ggVG", vim.tbl_extend("force", opts, { desc = "Select all" }))
-------------------------------------------------------------------------------
-- Buffers
-------------------------------------------------------------------------------
keymap("n", "<leader>ee", "<cmd>edit $MYVIMRC<CR>", vim.tbl_extend("force", opts, { desc = "Edit Neovim config" }))
