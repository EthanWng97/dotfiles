local M = {
	"numToStr/Comment.nvim",
	keys = {
		{
			"<C-_>",
			mode = "n",
			"<Plug>(comment_toggle_linewise_current)",
		},
		{
			"<C-_>",
			mode = "x",
			"<Plug>(comment_toggle_linewise_visual)",
		},
		{
			"<C-M-_>",
			mode = "n",
			"<Plug>(comment_toggle_blockwise_current)",
		},
		{
			"<C-M-_>",
			mode = "x",
			"<Plug>(comment_toggle_blockwise_visual)",
		},
		{
			"<C-/>",
			mode = "n",
			"<Plug>(comment_toggle_linewise_current)",
		},
		{
			"<C-/>",
			mode = "x",
			"<Plug>(comment_toggle_linewise_visual)",
		},
		{
			"<C-M-/>",
			mode = "n",
			"<Plug>(comment_toggle_blockwise_current)",
		},
		{
			"<C-M-/>",
			mode = "x",
			"<Plug>(comment_toggle_blockwise_visual)",
		},
	},
}

function M.config()
	local comment = require("Comment")
	comment.setup({
		mappings = {
			basic = false,
			extra = false,
		},
	})
end

return M
