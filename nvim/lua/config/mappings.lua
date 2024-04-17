-- # Variables
local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- shorten function name
-- <mode>, <new-key>, <old-key>, <options>
local keymap = vim.api.nvim_set_keymap



-- # Leader Key

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "



-- # Normal Mode

-- Resize windows with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize -2<CR>", opts)

-- Navigate Buffers (= "tabs")
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- keymap("n", "<S-q>", ":bdelete<CR>", opts)
keymap("n", "<S-l>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<S-h>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<S-q>", "<Cmd>BufferClose<CR>", opts)

-- Split Window
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- split window equal width
keymap("n", "<leader>sq", ":close<CR>", opts) -- close current split window



-- # Visual Mode

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-j>", ":m .+1<CR>==", opts)
keymap("v", "<C-k>", ":m .-2<CR>==", opts)

-- don't override what has been copied
keymap("v", "p", '"_dP', opts)



-- # Visual Block Mode

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)


