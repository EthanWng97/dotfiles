local M = {
    "puremourning/vimspector",
    keys = { "<F9>" },
}

function M.config()
    vim.g.vimspector_enable_mappings = "VISUAL_STUDIO"
    vim.g.vimspector_install_gadgets = { "CodeLLDB", "debugpy" }

    vim.g.vimspector_base_dir = vim.fn.expand("$HOME/.config/nvim/vimspector")

    local opts = { noremap = true, silent = true }

    -- Shorten function name
    local keymap = vim.api.nvim_set_keymap
    keymap("n", "<F5>", "<Plug>VimspectorContinue", opts)
    keymap("n", "<F6>", "<Plug>VimspectorStop", opts)
    keymap("n", "<F7>", "<Plug>VimspectorRestart", opts)
    keymap("n", "<F9>", "<Plug>VimspectorToggleBreakpoint", opts)
    keymap("n", "<F10>", "<Plug>VimspectorStepOver", opts)
    keymap("n", "<F11>", "<Plug>VimspectorStepInto", opts)
    keymap("n", "<F12>", "<Plug>VimspectorStepOut", opts)

    keymap("n", "<leader>di", "<Plug>VimspectorBalloonEval", opts)
    keymap("x", "<leader>di", "<Plug>VimspectorBalloonEval", opts)
end

return M
