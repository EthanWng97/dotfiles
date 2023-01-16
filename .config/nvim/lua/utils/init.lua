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

function M.warn(msg, notify_opts)
    vim.notify(msg, vim.log.levels.WARN, notify_opts)
end

function M.error(msg, notify_opts)
    vim.notify(msg, vim.log.levels.ERROR, notify_opts)
end

function M.info(msg, notify_opts)
    vim.notify(msg, vim.log.levels.INFO, notify_opts)
end

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
function M.toggle(option, silent, values)
    if values then
        if vim.opt_local[option]:get() == values[1] then
            vim.opt_local[option] = values[2]
        else
            vim.opt_local[option] = values[1]
        end
        return require("utils").info("Set " .. option .. " to " .. vim.opt_local[option]:get(), { title = "Option" })
    end
    vim.opt_local[option] = not vim.opt_local[option]:get()
    if not silent then
        if vim.opt_local[option]:get() then
            require("utils").info("Enabled " .. option, { title = "Option" })
        else
            require("utils").warn("Disabled " .. option, { title = "Option" })
        end
    end
end

return M
