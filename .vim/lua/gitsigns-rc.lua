require('gitsigns').setup{
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 50,
		ignore_whitespace = false,
	},
	signs = {
    add          = {hl = 'DiffAdd'   , text = '┃', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
    change       = {hl = 'DiffChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delette      = {hl = 'DiffDelete', text = '▸', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'DiffDelete', text = '▸', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'DiffChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
}
