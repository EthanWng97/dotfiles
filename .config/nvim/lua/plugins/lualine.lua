local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		local navic = require("nvim-navic")
		local colors = require("tokyonight.colors").setup()
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
		local filename = { "filename", path = 4, color = { bg = colors.bg } }
		return {
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = "",
				component_separators = "",
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
				lualine_z = { location, "selectioncount" },
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
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					filename,
					{
						function()
							return navic.get_location()
						end,
						cond = function()
							return navic.is_available()
						end,
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					filename,
					{ navic.get_location, cond = navic.is_available },
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "lazy" },
		}
	end,
}

return M
