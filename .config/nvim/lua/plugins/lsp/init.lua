local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("plugins.lsp.lsp-handlers").setup()
require("plugins.lsp.lsp-config")
