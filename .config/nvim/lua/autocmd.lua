vim.api.nvim_create_autocmd(
    { 'CursorHold' }, {
    pattern = { '*' },
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
    end
})
vim.api.nvim_create_autocmd(
    { 'BufWritePre' }, {
    pattern = { '*' },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end
})
-- vim.cmd([[
--     autocmd! BufWritePre * lua vim.lsp.buf.format({ async = true })
-- ]])

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd filetype alpha setlocal nofoldenable
]])
