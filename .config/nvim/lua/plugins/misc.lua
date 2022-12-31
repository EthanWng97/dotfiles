-- All plugins are lazy-loaded by default
return {
    { "nvim-lua/plenary.nvim" },
    -- debug plugins
    { "puremourning/vimspector" },
    -- { "mfussenegger/nvim-dap" },
    -- { "rcarriga/nvim-dap-ui" },

    -- UI
    { "MunifTanjim/nui.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "folke/tokyonight.nvim" },
    { "lunarvim/darkplus.nvim", lazy = false },

    -- Utilities
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = { options = { "buffers,curdir,folds,help,tabpages,terminal,globals" } },
    },
}
