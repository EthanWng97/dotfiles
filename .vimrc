""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'puremourning/vimspector'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'github/copilot.vim'

if has("nvim")
  Plug 'nvim-lua/plenary.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'nvim-treesitter/playground'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'fannheyward/telescope-coc.nvim'
  Plug 'nvim-telescope/telescope-vimspector.nvim'
  Plug 'LinArcX/telescope-env.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'stevearc/aerial.nvim'
  Plug 'Mofiqul/vscode.nvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'luukvbaal/stabilize.nvim'
  Plug 'sindrets/diffview.nvim'
  Plug 'karb94/neoscroll.nvim'
  Plug 'rmagatti/auto-session'
  Plug 'rmagatti/session-lens'
  Plug 'lewis6991/impatient.nvim'
  Plug 'arkav/lualine-lsp-progress'
  Plug 'ahmedkhalf/project.nvim'
  " Plug 'williamboman/nvim-lsp-installer'
  " Plug 'ful1e5/onedark.nvim'
endif

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype on
filetype plugin on
autocmd BufNewFile,BufRead *.json setl ft=jsonc
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

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
set backspace=indent,eol,start
set autoindent smartindent

set mouse=a
set clipboard=unnamed
set nocompatible
set showcmd
set autoread                " reload files if changed externally
set ignorecase smartcase
set hlsearch                " highlight searches
set pumheight=10
set noshowmode              " we don't need to see things like -- INSERT -- anymore
set undofile                " enable persistent undo
set nobackup nowritebackup

set sidescrolloff=5         " Start scrolling n chars before end of screen.

"""""" UI """"""
set termguicolors
autocmd colorscheme * highlight DiffAdd gui=none guifg=#A1C281 guibg=None
autocmd colorscheme * highlight DiffChange gui=none guifg=#74ADEA guibg=None
autocmd colorscheme * highlight DiffDelete gui=none guifg=#FE747A guibg=None
autocmd colorscheme * highlight CocHighlightText gui=undercurl term=undercurl

let g:vscode_style = "dark"
" let g:vscode_transparency = 1
let g:vscode_italic_comment = 1
let g:vscode_disable_nvimtree_bg = v:true

let g:onedark_transparent = v:true
let g:onedark_transparent_sidebar = v:true
let g:onedark_highlight_linenumber = v:true
let g:onedark_dark_sidebar = v:false
let g:onedark_dark_float = v:false
colorscheme vscode

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

"""""" remap """"""
let mapleader = ','
nmap <leader>a ggVG
imap <leader>a <Esc>ggVG

nmap <leader>o <cmd>lua require('telescope.builtin').find_files()<cr>
imap <leader>o <Esc><cmd>lua require('telescope.builtin').find_files()<cr>

nmap <leader>p <cmd>lua require('telescope.builtin').commands()<cr>
imap <leader>p <Esc><cmd>lua require('telescope.builtin').commands()<cr>

nmap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
imap <leader>g <Esc><cmd>lua require('telescope.builtin').live_grep()<cr>

nmap <leader>ff <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
imap <leader>ff <Esc><cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>


nmap <leader>e :NvimTreeToggle<CR>
vmap <leader>e :NvimTreeToggle<CR>
imap <leader>e <Esc>:NvimTreeToggle<CR>
nmap <leader>r :NvimTreeRefresh<CR>

nmap <leader>s :w<CR>
imap <leader>s <Esc>:w<CR>
nmap <leader>q :q<CR>
nmap <leader>qq :qa!<CR>
nmap <leader>/ :lua require("Comment.api").toggle_current_linewise()<CR>
vmap <leader>/ :lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>
imap <leader>/ <Esc>:lua require("Comment.api").toggle_current_linewise()<CR>

nmap <leader>w :bd<CR>
imap <leader>w <Esc>:bd<CR>
imap <C-r> <Esc><C-r>
imap <leader>z <Esc>u
nmap <space> :
map <leader>d "_dd

"nmap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
function! TabEnable()
    let num = winnr('$')
    if num == 1 
        return ":bnext\<CR>"
    else
        return "\<C-W>w"
    endif
endfunction
nmap <expr> <silent> <Tab> TabEnable()

nmap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"
command! -nargs=0 UpdateAll :exe "TSUpdate" | exe "CocUpdate" | exe "PlugUpdate" | exe "PlugUpgrade"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for coc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_config_home = '~/.vim'
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-css',
    \ 'coc-tabnine',
    \ 'coc-prettier',
    \ 'coc-html',
    \ 'coc-htmlhint',
    \ 'coc-clangd',
    \ 'coc-markdownlint',
    \ 'coc-pairs',
    "\ 'coc-webview',
    "\ 'coc-markdown-preview-enhanced',
    \ 'coc-pyright',
    \ 'coc-diagnostic',
    \ 'coc-syntax',
    \ 'coc-word',
    \ 'coc-spell-checker',
    \ 'coc-emmet',
    \ 'coc-pydocstring',
    \ 'coc-eslint',
    \ 'coc-fzf-preview',
    \ 'coc-snippets',
    \ 'coc-lua',
    \ 'coc-fish'
    \ ]

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
let g:cursorhold_updatetime = 100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

if has('nvim')
    set signcolumn=auto:2
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" confirms selection if any or just break line if none
function! EnterSelect()
    " if the popup is visible and an option is not selected
    if pumvisible() && complete_info()["selected"] == -1
        return "\<C-y>\<CR>"

    " if the pum is visible and an option is selected
    elseif pumvisible()
        return coc#_select_confirm()

    " if the pum is not visible
    else
        return "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    endif
endfunction
inoremap <silent><expr> <cr> EnterSelect()
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
" \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for vimspector
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
let g:vimspector_install_gadgets = [
    \ 'CodeLLDB',
    \ 'debugpy',
    \ ]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for Customized Command
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Coc :Telescope coc

if has("nvim")
	lua require('nvim-treesitter-rc')
	lua require('indent-blankline-rc')
	lua require('gitsigns-rc')
	lua require('lualine-rc')
	lua require('toggleterm-rc')
	lua require('bufferline-rc')
	lua require('nvim-tree-rc')
	lua require('colorizer').setup()
	lua require('telescope-rc')
	lua require('stabilize-rc')
	lua require('diffview-rc')
	lua require('neoscroll-rc')
	lua require('auto-session-rc')
	lua require('impatient')
	lua require("project_nvim").setup()
    lua require('aerial-rc')
	"lua require('onedark-rc')
	" lua require('trouble').setup{}
	" lua require('nvim-lspconfig-rc')
endif
