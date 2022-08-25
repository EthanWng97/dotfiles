require("Comment").setup({
	toggler = {
		---Line-comment toggle keymap
		line = "<C-_>",
		---Block-comment toggle keymap
		block = "<C-M-_>",
	},
	opleader = {
		---Line-comment keymap
		line = "<C-_>",
		---Block-comment keymap
		block = "<C-M-_>",
	},
})

local api = require("Comment.api")

vim.keymap.set("n", "<C-/>", "<Plug>(comment_toggle_linewise_current)")
vim.keymap.set("x", "<C-/>", "<Plug>(comment_toggle_linewise_visual)")
vim.keymap.set("n", "<C-M-/>", "<Plug>(comment_toggle_blockwise_current)")
vim.keymap.set("x", "<C-M-/>", "<Plug>(comment_toggle_blockwise_visual)")
