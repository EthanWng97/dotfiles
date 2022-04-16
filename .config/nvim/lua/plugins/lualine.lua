require("nvim-gps").setup()
local gps = require("nvim-gps")
local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local location = { "location", padding = 0 }
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { "alpha", "dashboard", "toggleterm" },
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = { 'branch' },
        lualine_b = { { 'diff', source = diff_source }, 'diagnostics' },
        lualine_c = { 'filename', 'lsp_progress', { gps.get_location, cond = gps.is_available } },
        lualine_x = { 'encoding', spaces, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { location }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
