local M = {
    "puremourning/vimspector",
    init = function()
        vim.g.vimspector_enable_mappings = "VISUAL_STUDIO"
        vim.g.vimspector_install_gadgets = { "CodeLLDB", "debugpy" }
        vim.g.vimspector_base_dir = vim.fn.expand("$HOME/.config/nvim/vimspector")
    end,
    cmd = { "VimspectorInstall", "VimspectorUpdate" },
    keys = {
        { "<leader>di", "<Plug>VimspectorBalloonEval", mode = { "n", "x" } },
    },
}

return M
