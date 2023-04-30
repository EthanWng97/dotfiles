local utils = require("utils")

-- Remap command key
vim.keymap.set("n", "<leader><leader>", ":")
vim.keymap.set("n", "<C-p>", ":")

-- Better up/down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Navigate buffers
vim.keymap.set("n", "<C-M-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-M-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG<cr>", { desc = "Select all" })

-- Same file
vim.keymap.set({ "i", "v", "n" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Clear search results
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Paste without replace clipboard
vim.keymap.set("v", "p", '"_dP')

-- Move Lines
vim.keymap.set("n", "<C-M-j>", ":m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("v", "<C-M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<C-M-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("n", "<C-M-k>", ":m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "<C-M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<C-M-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- CLose buffer
vim.keymap.set({ "i", "v", "n" }, "<C-w>", "<cmd>bd<cr><esc>", { desc = "Close buffer" })
vim.keymap.set({ "i", "v", "n" }, "<C-M-w>", "<cmd>bd!<cr><esc>", { desc = "Close buffer" })

-- Exit neovim
vim.keymap.set({ "i", "v", "n" }, "<C-q>", "<cmd>q<cr>", { desc = "Exit Vim" })
vim.keymap.set({ "i", "v", "n" }, "<C-M-q>", "<cmd>qa!<cr>", { desc = "Exit Vim" })

-- Better move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Clear search results
vim.keymap.set("n", "<leader>f", "za")

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
vim.keymap.set("n", "<leader>q", utils.toggle_quickfix, { desc = "Toggle Quickfix Window" })

vim.keymap.set("n", "<C-M-f>", function()
    vim.lsp.buf.format({ async = false })
    vim.api.nvim_command("write")
end, { desc = "Lsp formatting" })
