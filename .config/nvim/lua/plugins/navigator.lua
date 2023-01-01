local M = {
    "numToStr/Navigator.nvim",
    keys = {
        { "<C-h>", "<cmd>NavigatorLeft<cr>" },
        { "<C-l>", "<cmd>NavigatorRight<cr>" },
        { "<C-k>", "<cmd>NavigatorUp<cr>" },
        { "<C-j>", "<cmd>NavigatorDown<cr>" },
    },
    config = function()
        require("Navigator").setup()
    end,
}

return M
