local M = {
	"luukvbaal/statuscol.nvim",
	event = "VeryLazy",
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			setopt = true,
			-- order = "NSFs",
			-- Number Sign Fold sep
			segments = {
				{
					text = { builtin.lnumfunc },
					click = "v:lua.ScLa",
				},
				{ text = { "%s" }, click = "v:lua.ScSa" },
				{
					text = { builtin.foldfunc, " " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScFa",
				},
			},
		}
	end,
}
return M
