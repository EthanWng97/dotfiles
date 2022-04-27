require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false
    },
    autopairs = { enable = true },
    autotag = { enable = true },
    indent = { enable = true, disable = {} },
    ensure_installed = "all",
    sync_install = true,
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installation
    refactor = {
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true
        },
        highlight_current_scope = { enable = false }

    }
}
