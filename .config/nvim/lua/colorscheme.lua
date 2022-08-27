vim.cmd([[
    """""" UI """"""
    autocmd colorscheme * highlight GitSignsAdd gui=none guifg=#A1C281 guibg=None
    autocmd colorscheme * highlight GitSignsChange gui=none guifg=#74ADEA guibg=None
    autocmd colorscheme * highlight GitSignsDelete gui=none guifg=#FE747A guibg=None
]])

local status_ok, vscode = pcall(require, "vscode")
if status_ok then
	vscode.setup({
		italic_comments = true,
	})
end

local status_ok, catppuccin = pcall(require, "catppuccin")
if status_ok then
	catppuccin.setup({
		transparent_background = false,
		compile = {
			enabled = true,
			path = vim.fn.stdpath("cache") .. "/catppuccin",
		},
		integrations = {
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
			},
			native_lsp = {
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			dap = {
				enabled = true,
				enable_ui = true,
			},
			hop = true,
			navic = {
				enabled = true,
				custom_bg = "NONE",
			},
		},
	})
end

vim.g.catppuccin_flavour = "mocha"

local status_ok, github = pcall(require, "github-theme")
if status_ok then
	github.setup({
		theme_style = "dark",
		function_style = "italic",
	})
end

local colorscheme = "catppuccin"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
