-- require nvim-lsp-installer
require("nvim-lsp-installer").setup {
    automatic_installation = false,
}

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

local on_attach = require('plugins.lsp-handlers').on_attach
local capabilities = require('plugins.lsp-handlers').capabilities


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

local capabilities_cpp = capabilities
capabilities_cpp.offsetEncoding = { "uts-16" }
require('lspconfig')['clangd'].setup {
    capabilities = capabilities_cpp
}

require('lspconfig')['diagnosticls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
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

vim.notify = function(msg, log_level, _opts)
    if msg:match("exit code") then return end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({ { msg } }, true, {})
    end
end
