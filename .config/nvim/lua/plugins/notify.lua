local M = {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
}

function M.config()
    local notify = require("notify")
    notify.setup({
        timeout = 2000,
        fps = 60,

        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
    })
end

return M
