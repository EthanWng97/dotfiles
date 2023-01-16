local opts = { noremap = true, silent = true }
local utils = require("utils")

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader><leader>", ":", opts)

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- better up/down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Navigate buffers
keymap("n", "<C-M-l>", ":bnext<CR>", opts)
keymap("n", "<C-M-h>", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<cr>", opts)

keymap("n", "<C-a>", "ggVG<CR>", opts)

-- save file
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

keymap("n", "<esc>", ":noh<cr>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- paste without replace clipboard
keymap("v", "p", '"_dP', opts)

-- Move Lines keymap("n", "<C-M-j>", ":m .+1<cr>==", opts)
keymap("x", "<C-M-j>", ":m '>+1<cr>gv=gv", opts)
keymap("i", "<C-M-j>", "<Esc>:m .+1<cr>==gi", opts)
keymap("n", "<C-M-k>", ":m .-2<cr>==", opts)
keymap("x", "<C-M-k>", ":m '<-2<cr>gv=gv", opts)
keymap("i", "<C-M-k>", "<Esc>:m .-2<cr>==gi", opts)

keymap("n", "<C-M-f>", ':exe "lua vim.lsp.buf.format({async = false})" | exe "w" <CR>', opts)
keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- close buffer
vim.keymap.set({ "i", "v", "n", "s" }, "<C-w>", "<cmd>bd<cr><esc>", { desc = "Close Buffer" })
vim.keymap.set({ "i", "v", "n", "s" }, "<C-M-w>", "<cmd>bd!<cr><esc>", { desc = "Close Buffer" })

-- exit neovim
vim.keymap.set({ "i", "v", "n", "s" }, "<C-q>", "<cmd>q<cr>", { desc = "Exit Vim" })
vim.keymap.set({ "i", "v", "n", "s" }, "<C-M-q>", "<cmd>qa!<cr>", { desc = "Exit Vim" })

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- toggle options
vim.keymap.set("n", "<leader>tw", function()
	utils.toggle("wrap")
end, { desc = "Toggle Word Wrap" })
vim.keymap.set("n", "<leader>ts", function()
	utils.toggle("spell")
end, { desc = "Toggle Spelling" })
vim.keymap.set("n", "<leader>tl", function()
	utils.toggle("relativenumber")
end, { desc = "Toggle Line Numbers" })
vim.keymap.set("n", "<leader>td", utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })
