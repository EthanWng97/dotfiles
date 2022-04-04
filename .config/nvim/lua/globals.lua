-- :help options
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- smart indent
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.sidescrolloff = 5 -- how many lines to scroll when using the scrollbar
vim.opt.autoread = true -- reload files if changed externally
vim.opt.showcmd = true -- show the command in the status bar
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.fillchars:append{eob = " "}
