vim.cmd([[
    """""" UI """"""
    autocmd colorscheme * highlight GitSignsAdd gui=none guifg=#A1C281 guibg=None
    autocmd colorscheme * highlight GitSignsChange gui=none guifg=#74ADEA guibg=None
    autocmd colorscheme * highlight GitSignsDelete gui=none guifg=#FE747A guibg=None
]])

local status_ok, catppuccin = pcall(require, "catppuccin")
if status_ok then
	catppuccin.setup({
		flavour = "mocha",
		transparent_background = false,
		compile = {
			enabled = true,
			path = vim.fn.stdpath("cache") .. "/catppuccin",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			cmp = true,
			gitsigns = true,
			telescope = true,
			nvimtree = true,
			dap = {
				enabled = true,
				enable_ui = true,
			},
			hop = true,
			notify = true,
			navic = {
				enabled = true,
				custom_bg = "NONE",
			},
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
			},
			treesitter_context = true,
		},
	})
end

local status_ok, tokyonight = pcall(require, "tokyonight")
tokyonight.setup({
	style = "night",
})

local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
