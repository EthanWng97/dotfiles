local opts = { noremap = true, silent = true }

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
keymap("n", "<C-M-l>", ":bnext<CR>", opts)
keymap("n", "<C-M-h>", ":bprevious<CR>", opts)
keymap("n", "<M-1>", ":LualineBuffersJump! 1<CR>", opts)
keymap("n", "<M-2>", ":LualineBuffersJump! 2<CR>", opts)
keymap("n", "<M-3>", ":LualineBuffersJump! 3<CR>", opts)
keymap("n", "<M-4>", ":LualineBuffersJump! 4<CR>", opts)
keymap("n", "<M-5>", ":LualineBuffersJump! 5<CR>", opts)
keymap("n", "<M-6>", ":LualineBuffersJump! 6<CR>", opts)
keymap("n", "<M-7>", ":LualineBuffersJump! 7<CR>", opts)
keymap("n", "<M-8>", ":LualineBuffersJump! 8<CR>", opts)
keymap("n", "<M-9>", ":LualineBuffersJump! $<CR>", opts)

keymap("n", "<C-e>", ":Telescope file_browser<CR>", opts)
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

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- paste without replace clipboard
keymap("v", "p", '"_dP', opts)

keymap("x", "<C-M-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-M-k>", ":move '<-2<CR>gv-gv", opts)

keymap("n", "<Tab>", ":bnext<cr>", opts)

keymap("n", "<leader>ww", ":set wrap!<CR>", opts)

keymap("n", "<C-M-a>", ":lua require('neogen').generate()<CR>", opts)
keymap("n", "<C-M-f>", ':exe "lua vim.lsp.buf.format({async = false})" | exe "w" <CR>', opts)

keymap("n", "<C-w>", ":bd<cr>", opts)
keymap("i", "<C-w>", "<esc>:bd<cr>", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
