-- require nvim-lsp-installer
require("nvim-lsp-installer").setup {
    automatic_installation = false,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Completion kinds
local servers = {
    'clangd', 'tsserver', 'pyright', 'sumneko_lua', 'eslint',
    'jsonls', 'cssls', 'html', 'yamlls', 'diagnosticls', 'graphql'
}

vim.diagnostic.config({
    virtual_text = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = ""

    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false
})


---- sign column
local signs = { Error = "✖ ", Warn = "! ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', '<leader>e',
-- '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
    opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>',
    opts)
-- vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)


vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
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

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in pairs(servers) do
    if lsp == "clangd" then
        capabilities.offsetEncoding = { "utf-16" }

    end
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

require('lspconfig')['diagnosticls'].setup {
    on_attach = on_attach,
    filetypes = { 'css' },
    init_options = {
        formatters = {
            prettier = {
                command = './node_modules/.bin/prettier',
                rootPatterns = { '.git' },
                -- requiredFiles: { 'prettier.config.js' },
                args = { '--tab-width 4', '--stdin', '--stdin-filepath', '%filename' }
            }
        },
        formatFiletypes = {
            css = 'prettier',
        }
    }
}
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.offsetEncoding = { "utf-16" }
-- require("lspconfig").clangd.setup({ capabilities = capabilities })

vim.notify = function(msg, log_level, _opts)
    if msg:match("exit code") then return end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({ { msg } }, true, {})
    end
end
