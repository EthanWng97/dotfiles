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
   Plug 'nvim-telescope/telescope-ui-select.nvim'
  
   " statusline plugins
   Plug 'nvim-lualine/lualine.nvim'
   Plug 'arkav/lualine-lsp-progress'

   " debug plugins
   Plug 'puremourning/vimspector'
   " Plug 'mfussenegger/nvim-dap'
   " Plug 'rcarriga/nvim-dap-ui'

   " UI
   Plug 'rcarriga/nvim-notify'
   Plug 'lukas-reineke/indent-blankline.nvim'
   Plug 'kyazdani42/nvim-web-devicons'
   Plug 'akinsho/bufferline.nvim'
   Plug 'norcalli/nvim-colorizer.lua'
   Plug 'Mofiqul/vscode.nvim'
   Plug 'goolord/alpha-nvim'

   " Utilities
   Plug 'windwp/nvim-autopairs'
   Plug 'lewis6991/gitsigns.nvim'
   Plug 'kyazdani42/nvim-tree.lua'
   Plug 'simrat39/symbols-outline.nvim'
   Plug 'numToStr/Comment.nvim'
   Plug 'luukvbaal/stabilize.nvim'
   Plug 'ggandor/lightspeed.nvim'
   Plug 'Shatur/neovim-session-manager'
   Plug 'ahmedkhalf/project.nvim'
   Plug 'aserowy/tmux.nvim'
endif

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting for Customized Command
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
    lua require('keymaps')
    lua require('globals')
    lua require('colorscheme')
    lua require('plugins.vimspector')
	lua require('plugins.treesitter')
	lua require('plugins.indent-blankline')
	lua require('plugins.gitsigns')
	lua require('plugins.lualine')
	lua require('plugins.bufferline')
	lua require('plugins.nvim-tree')
	lua require('plugins.colorizer')
	lua require('plugins.telescope')
	lua require('plugins.stabilize')
    lua require('plugins.session-manager')
	lua require("plugins.project")
    lua require('plugins.tmux')
    lua require('plugins.cmp')
	lua require('plugins.lspconfig')
    lua require('plugins.autopairs')
    lua require('sqlite')
    lua require('plugins.alpha')
    lua require('plugins.notify')
endif

