local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","
keymap("n", "<space>", ":", opts)

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Navigate buffers
keymap("n", "<C-M-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-M-h>", ":BufferLineCyclePrev<CR>", opts)

keymap("n", "<C-M-e>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-a>", "ggVG<CR>", opts)

keymap("n", "<C-M-o>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').commands()<cr>", opts)
keymap(
	"n",
	"<C-M-p>",
	"<cmd>lua require('telescope.builtin').builtin(require('telescope.themes').get_dropdown({}))<cr>",
	opts
)

keymap("n", "<C-g>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<C-f>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
keymap("n", "<C-q>", ":q<cr>", opts)
keymap("n", "<C-M-q>", ":qa!<cr>", opts)

keymap("n", "<C-s>", ":w<cr>", opts)
keymap("i", "<C-s>", "<esc>:w<cr>", opts)
keymap("n", "<esc>", ":noh<cr>", opts)

-- comment
keymap("n", "<C-M-m>", ":lua require('Comment.api').toggle_current_linewise()<cr>", opts)
keymap("v", "<C-M-m>", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", opts)
keymap("i", "<C-M-m>", "<Esc>:lua require('Comment.api').toggle_current_linewise()<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- paste without replace clipboard
keymap("v", "p", '"_dP', opts)

keymap("x", "<C-M-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-M-k>", ":move '<-2<CR>gv-gv", opts)

keymap("n", "<Tab>", ":BufferLineCycleNext<cr>", opts)

keymap("n", "<leader>ww", ":set wrap!<CR>", opts)

keymap("n", "<leader>nf", ":lua require('neogen').generate()<CR>", opts)
keymap("n", "<leader>fm", ":lua vim.lsp.buf.format({async = true})<CR>", opts)

keymap("n", "<C-w>", ":bd<cr>", opts)
keymap("i", "<C-w>", "<esc>:bd<cr>", opts)
