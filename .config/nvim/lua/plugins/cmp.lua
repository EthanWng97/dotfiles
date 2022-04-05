-- config for copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
-- load snippets
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- nvim-cmp setup
local cmp = require 'cmp'
local lspkind = require('lspkind')
cmp.setup {
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
                buffer = "[BUFFER]",
                nvim_lsp = "[LSP]",
                luasnip = "[SNIPPET]",
                cmp_tabnine = "[TN]",
                copilot = "[PILOT]",
                path = "[PATH]"
            })
        })
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ["`"] = cmp.mapping(function(fallback)
            cmp.mapping.abort()
            local copilot_keys = vim.fn["copilot#Accept"]()
            if copilot_keys ~= "" then
                vim.api.nvim_feedkeys(copilot_keys, "i", true)
            else
                fallback()
            end
        end)
    },
    sources = {
        {name = 'nvim_lsp'}, {name = 'nvim_lsp_signature_help'},
        {name = 'copilot'}, {name = 'spell'}, {name = "path"},
        {name = 'luasnip'}, {name = 'treesitter'}, {name = 'cmp_tabnine'},
        {name = 'buffer'}, {name = 'nvim_lua'}
    },
    documentation = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
    },
    experimental = {ghost_text = false}

}
