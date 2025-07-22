
local keymap = vim.keymap.set 
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Basic cursor movement shortcuts
keymap("n", "<leader>l", "$", vim.tbl_extend("force", opts, { desc = "Move to End of Line" }))
keymap("v", "<leader>l", "$", vim.tbl_extend("force", opts, { desc = "Move to End of Line" }))
keymap("n", "<leader>h", "^", vim.tbl_extend("force", opts, { desc = "Move to Beginning of Line" }))
keymap("v", "<leader>h", "^", vim.tbl_extend("force", opts, { desc = "Move to Beginning of Line" }))


-- Jumping lines
keymap("n", "<leader>j", "5j", vim.tbl_extend("force", opts, { desc = "Jump 5 Lines Down" }))
keymap("n", "<leader>k", "5k", vim.tbl_extend("force", opts, { desc = "Jump 5 Lines Up" }))

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

