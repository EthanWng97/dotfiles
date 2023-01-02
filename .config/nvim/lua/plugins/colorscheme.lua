local M = { "folke/tokyonight.nvim", lazy = false, priority = 1000 }

function M.config()
    local tokyonight = require("tokyonight")
    local colors = require("utils").colors
    tokyonight.setup({
        style = "night",
        -- hide_inactive_statusline = true,
        on_highlights = function(hl, c)
            hl.GitSignsAdd = {
                fg = colors.GitAdd,
            }
            hl.GitSignsChange = {
                fg = colors.GitChange,
            }
            hl.GitSignsDelete = {
                fg = colors.GitDelete,
            }
        end,
    })
    tokyonight.load()
end

return M
