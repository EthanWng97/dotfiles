local M = { "folke/tokyonight.nvim", lazy = false, priority = 1000 }

function M.config()
    vim.api.nvim_create_autocmd("colorscheme", {
        pattern = { "*" },
        callback = function()
            vim.cmd("highlight GitSignsAdd gui=none guifg=#A1C281 guibg=None")
        end,
    })
    vim.api.nvim_create_autocmd("colorscheme", {
        pattern = { "*" },
        callback = function()
            vim.cmd("highlight GitSignsChange gui=none guifg=#74ADEA guibg=None")
        end,
    })
    vim.api.nvim_create_autocmd("colorscheme", {
        pattern = { "*" },
        callback = function()
            vim.cmd("highlight GitSignsDelete gui=none guifg=#FE747A guibg=None")
        end,
    })

    local tokyonight = require("tokyonight")
    tokyonight.setup({
        style = "night",
        hide_inactive_statusline = true,
    })

    tokyonight.load()
end

return M
