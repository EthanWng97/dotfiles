local M = {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("config.lsp")
    end,
}

function M.config()
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local lsp_utils = require("plugins.lsp.lsp-utils")
    lsp_utils.setup()

    -- Completion kinds
    local servers = {
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

    mason_lspconfig.setup({
        ensure_installed = servers,
    })

    mason_lspconfig.setup_handlers({
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = lsp_utils.on_attach,
                capabilities = lsp_utils.capabilities,
            })
        end,

        ["pyright"] = function()
            lspconfig.pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off",
                        },
                    },
                },
            })
        end,
        ["clangd"] = function()
            local capabilities_cpp = lsp_utils.capabilities
            capabilities_cpp.offsetEncoding = { "uts-16" }
            lspconfig.clangd.setup({
                capabilities = capabilities_cpp,
            })
        end,
    })
end

return M
