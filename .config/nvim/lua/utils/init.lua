local M = {}

M.git_colors = {
    GitAdd = "#A1C281",
    GitChange = "#74ADEA",
    GitDelete = "#FE747A",
}
M.lsp_signs = { Error = "✖ ", Warn = "! ", Hint = " ", Info = " " }

M.mason_packages = {
    "bash-language-server",
    "black",
    "clang-format",
    "clangd",
    "codelldb",
    "codespell",
    "cspell",
    "css-lsp",
    "eslint-lsp",
    "graphql-language-service-cli",
    "html-lsp",
    "jdtls",
    "json-lsp",
    "lua-language-server",
    "markdownlint",
    "prettier",
    "pyright",
    "shfmt",
    "stylua",
    "tailwindcss-language-server",
    "taplo",
    "typescript-language-server",
    "yaml-language-server",
}

M.lsp_servers = {
    "clangd",
    "tsserver",
    "pyright",
    "sumneko_lua",
    "eslint",
    "bashls",
    "yamlls",
    "jsonls",
    "cssls",
    "taplo",
    "html",
    "graphql",
    "tailwindcss",
    "jdtls",
}

M.diagnostics_active = true

function M.toggle_diagnostics()
    M.diagnostics_active = not M.diagnostics_active
    if M.diagnostics_active then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end

function M.on_attach(on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

return M
