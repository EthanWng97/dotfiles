
local actions = require("telescope.actions")
require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close
			},
		},
	},

  extensions = {
	ctags_outline = {
        --ctags option
        ctags = {'ctags'},
		--ctags filetype option
	    ft_opt = {
			vim = '--vim-kinds=fk',
            lua = '--lua-kinds=fk',
        },
    },
	fzf = {
		fuzzy = true,                    -- false will only do exact matching
		override_generic_sorter = true,  -- override the generic sorter
		override_file_sorter = true,     -- override the file sorter
		case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  }
}
require('telescope').load_extension('coc')
require("telescope").load_extension("vimspector")
require('telescope').load_extension('env')
require('telescope').load_extension('aerial')
require('telescope').load_extension('fzf')
