local M = {
    "danymat/neogen",
    keys = {
        {
            "<leader>ga",
            function()
                require("neogen").generate({})
            end,
        },
    },
    opts = {
        snippet_engine = "luasnip",
    },
}

return M
