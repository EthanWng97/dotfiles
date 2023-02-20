local M = {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			hover = {
				enabled = true,
				delay = 0,
				reveal = { "close" },
			},
		},
	},
}

return M
