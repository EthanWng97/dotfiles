-- require('plugins')
-- require('commands')
require('options')
-- require('mappings')
-- require('colorscheme')
require('lazy-config')

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("commands")
    require("mappings")
  end,
})
