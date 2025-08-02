vim.g.mapleader = " "
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap("n", "<leader>pv", vim.cmd.Ex)


keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")


keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "=ap", "ma=ap'a")


-- greatest remap ever
keymap("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", "\"_d")



keymap("n", "<leader>s", [[:%s/]])
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


--- Move to beginning/end of line
keymap("n", "<leader>l", "$", vim.tbl_extend("force", opts, { desc = "Move to End of Line" }))
keymap("v", "<leader>l", "$", vim.tbl_extend("force", opts, { desc = "Move to End of Line" }))
keymap("n", "<leader>h", "^", vim.tbl_extend("force", opts, { desc = "Move to Beginning of Line" }))
keymap("v", "<leader>h", "^", vim.tbl_extend("force", opts, { desc = "Move to Beginning of Line" }))

-- Jumping lines
keymap("n", "<leader>j", "5j", vim.tbl_extend("force", opts, { desc = "Jump 5 Lines Down" }))
keymap("n", "<leader>k", "5k", vim.tbl_extend("force", opts, { desc = "Jump 5 Lines Up" }))

-- Insert mode: Ctrl + L to exit insert mode
keymap({"i","v"}, "<C-l>", "<Esc>", vim.tbl_extend("force", opts, { desc = "Exit Insert Mode" }))
