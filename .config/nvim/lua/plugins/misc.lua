-- All plugins are lazy-loaded by default
return {
    { "nvim-lua/plenary.nvim" },
    { "MunifTanjim/nui.nvim" },
    { "nvim-tree/nvim-web-devicons", opts = { default = true } },

    -- Utilities
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        keys = {
            {
                "<leader>ls",
                function()
                    require("persistence").load()
                end,
            },
        },
        opts = { options = { "buffers", "curdir", "folds", "help", "tabpages", "terminal", "globals" } },
    },
}
