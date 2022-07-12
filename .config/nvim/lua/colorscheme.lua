vim.cmd([[
    """""" UI """"""
    set termguicolors
    autocmd colorscheme * highlight GitSignsAdd gui=none guifg=#A1C281 guibg=None
    autocmd colorscheme * highlight GitSignsChange gui=none guifg=#74ADEA guibg=None
    autocmd colorscheme * highlight GitSignsDelete gui=none guifg=#FE747A guibg=None

    let g:vscode_italic_comment = 1

]])

local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup({
	transparent_background = false,
	integrations = {
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		native_lsp = {
			underlines = {
				errors = "undercurl",
				hints = "undercurl",
				warnings = "undercurl",
				information = "undercurl",
			},
		},
	},
})

local onedark = require("onedark")
onedark.setup({
	style = "darker",
})

local colorscheme = "vscode"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
