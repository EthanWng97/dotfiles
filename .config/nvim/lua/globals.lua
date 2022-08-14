-- :help options
-- vim.opt.backup = false
-- vim.opt.autoread = true -- reload files if changed externally
-- vim.opt.showcmd = true -- show the command in the status bar
-- vim.opt.hlsearch = true

vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- smart indent
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.sidescrolloff = 5 -- how many lines to scroll when using the scrollbar
vim.opt.autoindent = true
vim.opt.fillchars:append({ eob = " " })
vim.opt.signcolumn = "yes"
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,terminal,globals"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.updatetime = 100
vim.opt.writebackup = false
vim.opt.number = true
vim.opt.jumpoptions = "view"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cmdheight = 0

vim.cmd([[
    " general
    " set spelllang=en_us
    " set spelllang+=cjk
    " set spell
    syntax on
]])

vim.cmd([[
"""""" netrw """"""
    let g:netrw_fastbrowse = 0
    let g:netrw_banner=0
    let g:netrw_keepdir = 0
    let g:netrw_liststyle = 3
    let g:netrw_altv = 1
    let g:netrw_browse_split = 4
    autocmd FileType netrw setl bufhidden=wipe
]])

vim.cmd([[
    """""" command completion """"""
    set wildmenu
    set wildmode=longest:full,full
    set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*DS_STORE,*.db
]])

vim.cmd([[
    """""" folding """"""
    set foldmethod=indent       " fold based on indent
    set foldnestmax=10          " deepest fold is 20 levels
    set nofoldenable            " don't fold by default
    set foldlevel=2
]])
vim.cmd([[ 
    """""" tab and indentation """"""
    " relative line numbers
    " augroup numbertoggle
    "   autocmd!
    "   autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    "   autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    " augroup END
]])

vim.cmd([[
    command! -nargs=0 UpdateAll :exe "TSUpdate" | exe "PackerSync"
]])

vim.cmd([[
    command! Format execute 'lua vim.lsp.buf.format({async = false})'
]])
