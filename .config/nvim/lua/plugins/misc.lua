-- All plugins are lazy-loaded by default
return {
	{ "nvim-lua/plenary.nvim" },
	-- debug plugins
	{ "puremourning/vimspector" },
	-- { "mfussenegger/nvim-dap" },
	-- { "rcarriga/nvim-dap-ui" },

	-- UI
	{ "MunifTanjim/nui.nvim" },
	{ "nvim-tree/nvim-web-devicons", config = { default = true } },
	{ "folke/tokyonight.nvim" },
	{ "lunarvim/darkplus.nvim", lazy = false },

	-- Utilities
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		keys = {
			{
				"<leader>ls",
				function()
					require("persistence").load()
				end,
			},
		},
		config = { options = { "buffers,curdir,folds,help,tabpages,terminal,globals" } },
	},
}
