require("project_nvim").setup({
	exclude_dirs = { "~/Downloads", "~/Desktop" },
	detection_methods = { "pattern", "lsp" },
	ignore_lsp = {},
	silent_chdir = false,
})
