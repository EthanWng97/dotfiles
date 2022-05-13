local M = {}

local opts = { noremap = true, silent = true }

M.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
        '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
        '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
        '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
        '<cmd>lua vim.lsp.buf.implementation()<CR>',
        opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>',
        '<cmd>lua vim.lsp.buf.signature_help()<CR>',
        opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa',
    --                             '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
    --                             opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr',
    --                             '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
    --                             opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
    --                             '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    --                             opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D',
        '<cmd>lua vim.lsp.buf.type_definition()<CR>',
        opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',
        '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ac',
        '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
        '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-S-f>',
    --                             '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    if client.server_capabilities.document_highlight then
        vim.cmd [[
            hi! LspReferenceRead cterm=bold ctermbg=red guibg=#49494A
            hi! LspReferenceText cterm=bold ctermbg=red guibg=#49494A
            hi! LspReferenceWrite cterm=bold ctermbg=red guibg=#49494A
        ]]
        vim.api.nvim_create_augroup('lsp_document_highlight', {})
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = 0,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
            group = 'lsp_document_highlight',
            buffer = 0,
            callback = vim.lsp.buf.clear_references,
        })
    end
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
