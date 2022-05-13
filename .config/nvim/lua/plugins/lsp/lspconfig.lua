-- require nvim-lsp-installer
require("nvim-lsp-installer").setup {
    automatic_installation = false,
}

-- Completion kinds
local servers = {
    'clangd', 'tsserver', 'pyright', 'sumneko_lua', 'eslint',
    'jsonls', 'cssls', 'html', 'yamlls', 'diagnosticls', 'graphql'
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

local on_attach = require('plugins.lsp.lsp-handlers').on_attach
local capabilities = require('plugins.lsp.lsp-handlers').capabilities


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
