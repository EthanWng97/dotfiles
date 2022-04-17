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
vim.opt.fillchars:append { eob = " " }

vim.cmd [[
    " general
    set spelllang=en_us
    set spelllang+=cjk
    set spell
    syntax on
    filetype on
    filetype plugin on
    set updatetime=50
    let g:cursorhold_updatetime = 50
]]

vim.cmd [[
"""""" netrw """"""
    let g:netrw_fastbrowse = 0
    let g:netrw_banner=0
    let g:netrw_keepdir = 0
    let g:netrw_liststyle = 3
    let g:netrw_altv = 1
    let g:netrw_browse_split = 4
    autocmd FileType netrw setl bufhidden=wipe
]]

vim.cmd [[
    """""" command completion """"""
    set wildmenu
    set wildmode=longest:full,full
    set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*DS_STORE,*.db
]]

vim.cmd [[
    """""" folding """"""
    set foldmethod=indent       " fold based on indent
    set foldnestmax=10          " deepest fold is 20 levels
    set nofoldenable            " don't fold by default
    set foldlevel=2
]]
vim.cmd([[ 
    """""" tab and indentation """"""
    set tabstop=4                   " Tab is 4 spaces
    set shiftwidth=4                " The # of spaces for indenting.
    set softtabstop=4               " Tab key results in # spaces
    set ai                          " Tab key results in # spaces"Auto indent
    set si "Smart indent
    set smarttab
    set expandtab           "convert tabs to spaces
    set number                 "toggle the line numbers
    " relative line numbers
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
      autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
]])

vim.cmd [[
    command! -nargs=0 UpdateAll :exe "TSUpdate" | exe "PackerSync"
]]

vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,resize,winpos,terminal,globals"
