local opts = {noremap = true, silent = true}

local term_opts = {silent = true}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>a", "ggVG<CR>", opts)

keymap("n", "<leader>o",
       "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>p", "<cmd>lua require('telescope.builtin').commands()<cr>",
       opts)
keymap("n", "<leader>P", "<cmd>lua require('telescope.builtin').builtin()<cr>",
       opts)

keymap("n", "<leader>g",
       "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>f",
       "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
       opts)
keymap("n", "<leader>q", ":q<cr>", opts)
keymap("n", "<leader>Q", ":qa!<cr>", opts)
keymap("n", "<leader>w", ":bd<cr>", opts)

keymap("n", "<leader>s", ":w<cr>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- comment
keymap("n", "<leader>/",
       ":lua require('Comment.api').toggle_current_linewise()<cr>", opts)
keymap("v", "<leader>/",
       ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>",
       opts)
keymap("i", "<leader>/",
       "<Esc>:lua require('Comment.api').toggle_current_linewise()<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- paste without replace clipboard
keymap("v", "p", '"_dP', opts)
