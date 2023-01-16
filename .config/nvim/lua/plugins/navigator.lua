local M = {
	"numToStr/Navigator.nvim",
	event = "VeryLazy",
	keys = {
		{ "<C-h>", "<cmd>NavigatorLeft<cr>" },
		{ "<C-l>", "<cmd>NavigatorRight<cr>" },
		{ "<C-k>", "<cmd>NavigatorUp<cr>" },
		{ "<C-j>", "<cmd>NavigatorDown<cr>" },
	},
	config = true,
}

return M
