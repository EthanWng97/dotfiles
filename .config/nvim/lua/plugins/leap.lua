local M = {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function(_, opts)
        local leap = require("leap")
        vim.keymap.set("n", "s", function()
            local focusable_windows_on_tabpage = vim.tbl_filter(function(win)
                return vim.api.nvim_win_get_config(win).focusable
            end, vim.api.nvim_tabpage_list_wins(0))
            leap.leap({ target_windows = focusable_windows_on_tabpage })
        end)
    end,
}

return M
