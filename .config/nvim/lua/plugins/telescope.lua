local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local theme = require("telescope.themes")

telescope.setup {
    pickers = {
        find_files = { hidden = true, no_ignore=true },
        live_grep = { additional_args = function(opts) return { "--hidden" } end }
    },
    defaults = {
        mappings = { i = { ["<esc>"] = actions.close } },
        file_ignore_patterns = { "node_modules", ".git", "cache", "vscode", "Documents" }
    },

    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
            theme.get_dropdown {
                -- even more opts
            }
        },
        project = {
            hidden_files = true,
            theme = "dropdown"
        }
    }
}
telescope.load_extension("vimspector")
telescope.load_extension('fzf')
telescope.load_extension("frecency")
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")
telescope.load_extension('project')
