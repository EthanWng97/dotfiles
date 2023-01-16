-- statusline plugins
local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		local navic = require("nvim-navic")
		local function diff_source()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed,
				}
			end
		end

		local location = { "location", padding = 0 }
		return {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "branch" },
				lualine_b = {
					{ "diff", source = diff_source },
					"diagnostics",
				},
				lualine_c = {
					{
						function()
							return require("noice").api.status.mode.get()
						end,
						cond = function()
							require("noice").api.status.mode.has()
						end,
					},
					{ require("lazy.status").updates, cond = require("lazy.status").has_updates },
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { location },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { location },
			},
			winbar = {
				lualine_a = { { "buffers", symbols = {
					alternate_file = "",
				} } },
				lualine_b = {},
				lualine_c = { { navic.get_location, cond = navic.is_available } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},

			inactive_winbar = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = { { navic.get_location, cond = navic.is_available } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		}
	end,
}

return M
