local M = {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
}

function M.config()
    require("copilot").setup({
        ft_disable = { "markdown", "terraform", "cpp" },
    })
end

return M
