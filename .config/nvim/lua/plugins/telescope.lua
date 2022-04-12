local actions = require("telescope.actions")
require('telescope').setup {
    pickers = {
        find_files = { hidden = true },
        live_grep = { additional_args = function(opts) return { "--hidden" } end }
    },
    defaults = {
        mappings = { i = { ["<esc>"] = actions.close } },
        file_ignore_patterns = { "node_modules", ".git" }
    },

    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
        -- ["ui-select"] = {
        --     require("telescope.themes").get_dropdown {
        --         -- even more opts
        --     }
        -- }
    }
}
require("telescope").load_extension("vimspector")
require('telescope').load_extension('fzf')
require "telescope".load_extension("frecency")
require("telescope").load_extension("file_browser")
-- require("telescope").load_extension("session-lens")
-- require("telescope").load_extension("ui-select")
