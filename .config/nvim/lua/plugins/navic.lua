local M = {
    "SmiteshP/nvim-navic",
    init = function()
        vim.g.navic_silence = true
        require("utils").on_attach(function(client, buffer)
            if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, buffer)
            end
        end)
    end,
    opts = {
        icons = {
            File = " ",
            Module = " ",
            Namespace = " ",
            Package = " ",
            Class = " ",
            Method = " ",
            Property = " ",
            Field = " ",
            Constructor = " ",
            Enum = " ",
            Interface = " ",
            Function = " ",
            Variable = " ",
            Constant = " ",
            String = " ",
            Number = " ",
            Boolean = " ",
            Array = " ",
            Object = " ",
            Key = " ",
            Null = " ",
            EnumMember = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
        },
        highlight = true,
    },
}

return M
