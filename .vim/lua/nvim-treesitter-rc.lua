require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "json",
    "html",
    "python",
	"cpp", 
	"comment",
	--"css",
	"vim",
	"regex",
	"swift",
	"javascript",
  },
   sync_install = true,
}

