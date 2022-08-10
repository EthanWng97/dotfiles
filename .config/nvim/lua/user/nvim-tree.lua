require("nvim-tree").setup({
	update_cwd = false,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 400,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
})
