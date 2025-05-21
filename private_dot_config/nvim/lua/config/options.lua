vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.hidden = true
vim.opt.splitbelow = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,trail:·"
vim.opt.confirm = true
vim.opt.wrap = false
vim.opt.conceallevel = 0 -- makes '' visible in markup
vim.opt.swapfile = false
vim.opt.cmdheight = 2
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.autochdir = false

----- Keymaps -----
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "ö", "[", { silent = true })
keymap("n", "ä", "]", { silent = true })
