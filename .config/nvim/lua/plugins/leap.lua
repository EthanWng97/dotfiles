local M = {
    "ggandor/leap.nvim",
    event = "VeryLazy",

    config = function()
        require("leap").add_default_mappings()
    end,
}

return M
