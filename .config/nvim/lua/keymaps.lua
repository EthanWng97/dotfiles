local opts = {noremap = true, silent = true}

local term_opts = {silent = true}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

keymap("n", "<C-e>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-a>", "ggVG<CR>", opts)

keymap("n", "<C-A-o>", "<cmd>lua require('telescope.builtin').find_files()<cr>",
       opts)
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').commands()<cr>",
       opts)
keymap("n", "<C-A-p>", "<cmd>lua require('telescope.builtin').builtin()<cr>",
       opts)

keymap("n", "<C-g>", "<cmd>lua require('telescope.builtin').live_grep()<cr>",
       opts)
keymap("n", "<C-f>",
       "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
       opts)
keymap("n", "<C-q>", ":q<cr>", opts)
keymap("n", "<C-A-q>", ":qa!<cr>", opts)
keymap("n", "<C-w>", ":bd<cr>", opts)

keymap("n", "<C-s>", ":w<cr>", opts)
keymap("i", "<C-s>", "<Esc>:w<cr>", opts)

-- comment
keymap("n", "<C-_>",
       ":lua require('Comment.api').toggle_current_linewise()<cr>", opts)
keymap("v", "<C-_>",
       ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>",
       opts)
keymap("i", "<C-_>",
       "<Esc>:lua require('Comment.api').toggle_current_linewise()<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- paste without replace clipboard
keymap("v", "p", '"_dP', opts)
