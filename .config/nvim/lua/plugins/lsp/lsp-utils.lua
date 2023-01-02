local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local opts = { noremap = true, silent = true }

local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
    return
end

M.setup = function()
    vim.diagnostic.config({
        virtual_text = false,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = false,
    })

    ---- sign column
    local signs = { Error = "✖ ", Warn = "! ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions

    -- vim.api.nvim_set_keymap('n', '<leader>e',
    -- '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    -- vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    -- vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    -- vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    --
    -- vim.lsp.handlers["textDocument/signatureHelp"] =
    -- 	vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

M.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
    -- vim.keymap.set("n", "<C-M-f>", function()
    -- 	vim.lsp.buf.format({ async = false })
    -- end, bufopts)

    -- show diagnostics in hover window
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = "rounded",
                source = "always",
                prefix = " ",
                scope = "cursor",
            }
            vim.diagnostic.open_float(nil, opts)
        end,
    })
    navic.attach(client, bufnr)
end

return M
