local M = {
	"ahmedkhalf/project.nvim",
	event = "VimEnter",
	opts = {
		exclude_dirs = { "~/Downloads", "~/Desktop" },
		detection_methods = { "pattern", "lsp" },
		ignore_lsp = {},
		silent_chdir = false,
	},
	config = function(_, opts)
		require("project_nvim").setup(opts)
	end,
}

return M
