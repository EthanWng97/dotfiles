""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'puremourning/vimspector'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
Plug 'arzg/vim-colors-xcode'
Plug 'github/copilot.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'Yggdroot/indentLine'
Plug 'antoinemadec/coc-fzf'
Plug 'mbbill/undotree'
"Plug 'dense-analysis/ale'
"Plug 'airblade/vim-gitgutter'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype on
filetype plugin on
let g:netrw_fastbrowse = 0

"""""" command completion """"""
set wildmenu
set wildmode=longest:full,full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*DS_STORE,*.db

"""""" folding """"""
set foldmethod=indent       " fold based on indent
set foldnestmax=3           " deepest fold is 3 levels
set nofoldenable            " don't fold by default

"""""" tab and indentation """"""
set tabstop=4                   " Tab is 4 spaces
set shiftwidth=4				" The # of spaces for indenting.
set softtabstop=4				" Tab key results in # spaces
set ai					" Tab key results in # spaces"Auto indent
set si "Smart indent
set smarttab
set nu!					"" toggle the line numbers
set backspace=indent,eol,start
set autoindent smartindent



set mouse=a
set clipboard=unnamed
set nocompatible
set showcmd
set autoread                " reload files if changed externally
set ignorecase smartcase
set hlsearch                " highlight searches
"set spell spelllang=en_us,cjk

set scrolloff=5             " Start scrolling n lines before horizontal
                            "   border of window.
set sidescrolloff=5         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll
                            "   horizontally.


"""""" UI """"""
highlight Comment cterm=italic gui=italic
"highlight SignColumn ctermbg=235
autocmd ColorScheme * highlight CocHighlightText ctermbg=242 
set termguicolors
colorscheme xcodedark
let g:airline_theme='xcodedark'

"set lines=60
"set columns=100 

"au BufRead * let &numberwidth = float2nr(log10(line("$"))) + 1
		  "\| let &columns = &numberwidth + 100

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)
let mapleader = ','

"""""" remap """"""
nmap <silent> <C-f> :Rg<CR>
nmap <silent> <C-o> :Files<CR>
nmap <silent> <C-p> :CocFzfList<CR>
imap <silent> <C-p> <Esc>:CocFzfList<CR>
nmap <C-e> <Cmd>CocCommand explorer<CR>
"nmap <Tab>  <c-W>w
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
nmap <C-Q> :q<CR>
nmap <C-Q><C-Q> :qa!<CR>
nmap <silent> <C-_> <Plug>NERDCommenterToggle
vmap <silent> <C-_> <Plug>NERDCommenterToggle
nmap <space> :
nmap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <C-J> <C-W>w
map <leader>d "_dd
nnoremap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ale_sign_error = '✖'
"let g:ale_sign_warning = '⚠'
"let g:ale_disable_lsp = 1
"let g:airline#extensions#ale#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for coc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_config_home = '~/.vim'
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-css',
	\ 'coc-tabnine',
	\ 'coc-prettier',
	\ 'coc-pairs',
	\ 'coc-html',
	\ 'coc-htmlhint',
	\ 'coc-git',
	\ 'coc-clangd',
	\ 'coc-markdownlint',
	"\ 'coc-lightbulb',
	"\ 'coc-webview',
	"\ 'coc-markdown-preview-enhanced',
	\ 'coc-pyright',
	\ 'coc-diagnostic',
	\ 'coc-syntax',
	\ 'coc-word',
	\ 'coc-spell-checker',
	\ 'coc-emmet',
	\ 'coc-pydocstring',
	\ 'coc-vimlsp',
	\ 'coc-explorer',
	\ 'coc-eslint',
	\ ]

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

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
							  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

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
" General Setting for airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for Prettier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=0 Prettier :CocCommand prettier.formatFile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for coc-explorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char_list = ['┊']
let g:indentLine_fileTypeExclude = ['coc-explorer']
