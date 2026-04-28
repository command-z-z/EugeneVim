-- leader set to space
vim.g.mapleader = " "

local opts = { silent = true, noremap = true }
local keymap = vim.keymap.set
-----------------------------------------------------------------------------
-- window
-------------------------------------------------------------------------------
-- Split window
keymap("n", "ss", "<cmd>split<CR><C-w>w", vim.tbl_extend("force", opts, { desc = "Split window horizontally" }))
keymap("n", "sv", "<cmd>vsplit<CR><C-w>w", vim.tbl_extend("force", opts, { desc = "Split window vertically" }))
-- Move window
keymap("n", "sh", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Move to left window" }))
keymap("n", "sk", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Move to upper window" }))
keymap("n", "sj", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Move to lower window" }))
keymap("n", "sl", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Move to right window" }))
-- Resize window
keymap("n", "<M-left>", "<C-w><", vim.tbl_extend("force", opts, { desc = "Decrease window width" }))
keymap("n", "<M-right>", "<C-w>>", vim.tbl_extend("force", opts, { desc = "Increase window width" }))
keymap("n", "<M-up>", "<C-w>+", vim.tbl_extend("force", opts, { desc = "Increase window height" }))
keymap("n", "<M-down>", "<C-w>-", vim.tbl_extend("force", opts, { desc = "Decrease window height" }))
-- insert mode to move cursor
keymap("i", "<C-h>", "<Left>", vim.tbl_extend("force", opts, { desc = "Move cursor left" }))
keymap("i", "<C-j>", "<Down>", vim.tbl_extend("force", opts, { desc = "Move cursor down" }))
keymap("i", "<C-k>", "<Up>", vim.tbl_extend("force", opts, { desc = "Move cursor up" }))
keymap("i", "<C-l>", "<Right>", vim.tbl_extend("force", opts, { desc = "Move cursor right" }))
keymap("i", "<C-d>", "<Delete>", vim.tbl_extend("force", opts, { desc = "Delete next character" }))
-- jk equal <Esc>
keymap("i", "jk", "<Esc>", vim.tbl_extend("force", opts, { desc = "Exit insert mode" }))
-- to start of end line
keymap("n", "L", "$", vim.tbl_extend("force", opts, { desc = "Go to end of line" }))
keymap("n", "H", "^", vim.tbl_extend("force", opts, { desc = "Go to first non-blank character" }))
keymap("v", "L", "$", vim.tbl_extend("force", opts, { desc = "Select to end of line" }))
keymap("v", "H", "^", vim.tbl_extend("force", opts, { desc = "Select to first non-blank character" }))
-- next five line
keymap({ "n", "v", "o" }, "<C-j>", "5j", vim.tbl_extend("force", opts, { desc = "Move down 5 lines" }))
keymap({ "n", "v", "o" }, "<C-k>", "5k", vim.tbl_extend("force", opts, { desc = "Move up 5 lines" }))
keymap({ "n", "v", "o" }, "<C-h>", "5h", vim.tbl_extend("force", opts, { desc = "Move left 5 characters" }))
keymap({ "n", "v", "o" }, "<C-l>", "5l", vim.tbl_extend("force", opts, { desc = "Move right 5 characters" }))
-- save
keymap("n", "s", "<cmd>w<CR>", vim.tbl_extend("force", opts, { desc = "Save file" }))
keymap("n", "<C-s>", "<cmd>w<CR>", vim.tbl_extend("force", opts, { desc = "Save file" }))
keymap("i", "<C-s>", "<Esc><cmd>w<CR>", vim.tbl_extend("force", opts, { desc = "Save file" }))
-- quit
keymap("n", "Q", "<cmd>q<CR>", vim.tbl_extend("force", opts, { desc = "Quit window" }))
-- select all
keymap("n", "<C-a>", "ggVG", vim.tbl_extend("force", opts, { desc = "Select all" }))
-------------------------------------------------------------------------------
-- Buffers
-------------------------------------------------------------------------------
-- Open current directory
keymap("n", "<S-Tab>", "<cmd>bprev<CR>", vim.tbl_extend("force", opts, { desc = "Previous buffer" }))
keymap("n", "<Tab>", "<cmd>bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
keymap("n", "<leader>bd", "<cmd>bd<CR>", vim.tbl_extend("force", opts, { desc = "Delete buffer" }))
-- 系统剪贴板
keymap("n", "<leader>y", '"+y', vim.tbl_extend("force", opts, { desc = "Yank to system clipboard" }))
keymap("n", "<leader>p", '"+p', vim.tbl_extend("force", opts, { desc = "Paste from system clipboard" }))
-- open personal dotfile
keymap("n", "<leader>ee", "<cmd>edit $MYVIMRC<CR>", vim.tbl_extend("force", opts, { desc = "Edit Neovim config" }))
