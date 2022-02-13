require('gitsigns').setup{
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 50,
		ignore_whitespace = false,
	},
	signs = {
    add          = {hl = 'DiffAdd'   , text = '┃', numhl='GitSignsAddNr'},
    change       = {hl = 'DiffChange', text = '┃', numhl='GitSignsChangeNr'},
    delette      = {hl = 'DiffDelete', text = '▸', numhl='GitSignsDeleteNr'},
    topdelete    = {hl = 'DiffDelete', text = '▸', numhl='GitSignsDeleteNr'},
    changedelete = {hl = 'DiffChange', text = '~', numhl='GitSignsChangeNr'},
  }
}
