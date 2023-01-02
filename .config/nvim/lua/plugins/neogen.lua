local M = {
	"danymat/neogen",
	keys = {
		{
			"<leader>ga",
			function()
				require("neogen").generate({})
			end,
		},
	},
}

function M.config()
	require("neogen").setup({ snippet_engine = "luasnip" })
end

return M
