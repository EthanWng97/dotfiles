 "Plug 'projekt0n/github-nvim-theme' set runtimepath+=~/.vim runtimepath+=~/.vim/after
	" let &packpath = &runtimepath
	" source ~/.vimrc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')

if has("nvim")
   " nvimlsp plugins
   Plug 'neovim/nvim-lspconfig'
   Plug 'nvim-lua/popup.nvim'
   Plug 'nvim-lua/plenary.nvim'

   " autocomplete plugins
   Plug 'hrsh7th/nvim-cmp'
   Plug 'hrsh7th/cmp-nvim-lsp'
   Plug 'hrsh7th/cmp-buffer'
   Plug 'hrsh7th/cmp-path'
   Plug 'hrsh7th/cmp-cmdline'
   Plug 'hrsh7th/nvim-cmp'
   Plug 'hrsh7th/cmp-copilot'
   Plug 'hrsh7th/cmp-nvim-lua'
   Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
   Plug 'onsails/lspkind-nvim'
   Plug 'saadparwaiz1/cmp_luasnip'
   Plug 'L3MON4D3/LuaSnip'
   Plug 'f3fora/cmp-spell'
   Plug 'github/copilot.vim'
  
  " treesitter plugins
   Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
   Plug 'nvim-treesitter/nvim-treesitter-refactor'
   Plug 'nvim-treesitter/nvim-treesitter-angular'
   Plug 'lewis6991/spellsitter.nvim'
   Plug 'windwp/nvim-ts-autotag'
  
   " telescope plugins
   Plug 'nvim-telescope/telescope.nvim'
   Plug 'nvim-telescope/telescope-vimspector.nvim'
   Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
   Plug 'tami5/sqlite.lua'
   Plug 'nvim-telescope/telescope-frecency.nvim'
   Plug 'nvim-telescope/telescope-file-browser.nvim'
  
   " statusline plugins
   Plug 'nvim-lualine/lualine.nvim'
   Plug 'arkav/lualine-lsp-progress'

   " debug plugins
   Plug 'puremourning/vimspector'
   " Plug 'mfussenegger/nvim-dap'
   " Plug 'rcarriga/nvim-dap-ui'

   Plug 'windwp/nvim-autopairs'
   Plug 'lukas-reineke/indent-blankline.nvim'
   Plug 'lewis6991/gitsigns.nvim'
   Plug 'kyazdani42/nvim-web-devicons'
   Plug 'akinsho/bufferline.nvim'
   Plug 'kyazdani42/nvim-tree.lua'
   Plug 'norcalli/nvim-colorizer.lua'
   Plug 'stevearc/aerial.nvim'
   Plug 'Mofiqul/vscode.nvim'
   Plug 'numToStr/Comment.nvim'
   Plug 'luukvbaal/stabilize.nvim'
   " Plug 'karb94/neoscroll.nvim'
   Plug 'ggandor/lightspeed.nvim'
   Plug 'rmagatti/auto-session'
   " Plug 'rmagatti/session-lens'
   Plug 'ahmedkhalf/project.nvim'
   Plug 'aserowy/tmux.nvim'
endif

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=en_us
set spelllang+=cjk
set spell
syntax on
filetype on
filetype plugin on
autocmd BufNewFile,BufRead *.json setl ft=jsonc

"""""" netrw """"""
let g:netrw_fastbrowse = 0
let g:netrw_banner=0
let g:netrw_keepdir = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_browse_split = 4
autocmd FileType netrw setl bufhidden=wipe

"""""" command completion """"""
set wildmenu
set wildmode=longest:full,full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*DS_STORE,*.db

"""""" folding """"""
set foldmethod=indent       " fold based on indent
set foldnestmax=10          " deepest fold is 20 levels
set nofoldenable            " don't fold by default
set foldlevel=2

"""""" tab and indentation """"""
set tabstop=4                   " Tab is 4 spaces
set shiftwidth=4				" The # of spaces for indenting.
set softtabstop=4				" Tab key results in # spaces
set ai					" Tab key results in # spaces"Auto indent
set si "Smart indent
set smarttab
set expandtab           "convert tabs to spaces
set nu!                 "toggle the line numbers
" relative line numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

"""""" UI """"""
set termguicolors
autocmd colorscheme * highlight GitSignsAdd gui=none guifg=#A1C281 guibg=None
autocmd colorscheme * highlight GitSignsChange gui=none guifg=#74ADEA guibg=None
autocmd colorscheme * highlight GitSignsDelete gui=none guifg=#FE747A guibg=None

let g:vscode_style = "dark"
let g:vscode_transparency = 1
let g:vscode_italic_comment = 1
let g:vscode_disable_nvimtree_bg = v:true

let g:onedark_transparent = v:true
let g:onedark_transparent_sidebar = v:true
let g:onedark_highlight_linenumber = v:true
let g:onedark_dark_sidebar = v:false
let g:onedark_dark_float = v:false
colorscheme vscode

set guicursor=i:ver100-blinkon100
            \,r:hor100

"""""" remap """"""

"nmap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
" function! TabEnable()
"     let num = winnr('$')
"     if num == 1
"         return ":bnext\<CR>"
"     else
"         return "\<C-W>w"
"     endif
" endfunction
" nmap <expr> <silent> <Tab> TabEnable()


nmap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"
command! -nargs=0 UpdateAll :exe "TSUpdate" | exe "PlugUpdate" | exe "PlugUpgrade"

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
let g:cursorhold_updatetime = 100

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

if has('nvim')
    set signcolumn=yes:1
else
    set signcolumn=yes
endif

" nnoremap  <A-d> :lua require'dap'.continue()<CR>
" nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
" nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
" nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
" nnoremap <silent> <F9> :lua require'dap'.toggle_breakpoint()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for vimspector
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
let g:vimspector_install_gadgets = [
    \ 'CodeLLDB',
    \ 'debugpy',
    \ ]
nmap <A-d> <Plug>VimspectorContinue
nmap <A-S-d> <Plug>VimspectorRestart
nmap <A-i> <Plug>VimspectorBalloonEval
xmap <A-i> <Plug>VimspectorBalloonEval
nmap <A-i> :call AddToWatch()<CR>

func! AddToWatch()
    let word = expand("<cexpr>")
    call vimspector#AddWatch(word)
endfunction
let g:vimspector_base_dir = expand('$HOME/.config/nvim/vimspector-config')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for Customized Command
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
    lua require('keymaps')
    lua require('globals')
	lua require('plugins.treesitter')
	lua require('plugins.indent-blankline')
	lua require('plugins.gitsigns')
	lua require('plugins.lualine')
	lua require('plugins.bufferline')
	lua require('plugins.nvim-tree')
	lua require('plugins.colorizer')
	lua require('plugins.telescope')
	lua require('plugins.stabilize')
	lua require('plugins.auto-session')
	lua require("plugins.project")
    lua require('plugins.aerial')
    lua require('plugins.tmux')
    lua require('plugins.nvim-cmp')
	lua require('plugins.nvim-lspconfig')
    lua require('plugins.autopairs')
    lua require('sqlite')
    " lua require('dap-rc')
	" lua require('neoscroll-rc')
endif

