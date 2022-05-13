local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- Completion kinds
local servers = {
    'clangd', 'tsserver', 'pyright', 'sumneko_lua', 'eslint',
    'jsonls', 'cssls', 'html', 'yamlls', 'diagnosticls', 'graphql'
}

lsp_installer.setup({
    ensure_installed = servers,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local on_attach = require('plugins.lsp.lsp-handlers').on_attach
local capabilities = require('plugins.lsp.lsp-handlers').capabilities


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

local capabilities_cpp = capabilities
capabilities_cpp.offsetEncoding = { "uts-16" }
lspconfig['clangd'].setup {
    capabilities = capabilities_cpp
}

lspconfig['diagnosticls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'css' },
    init_options = {
        formatters = {
            prettier = {
                command = './node_modules/.bin/prettier',
                rootPatterns = { '.git' },
                args = { '--tab-width', '4', '--stdin', '--stdin-filepath', '%filename' }
            }
        },
        formatFiletypes = {
            css = 'prettier',
        }
    }
}
