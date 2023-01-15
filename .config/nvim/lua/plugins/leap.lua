local M = {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function(_, opts)
        local leap = require("leap")
        leap.add_default_mappings()
    end,
}

return M
