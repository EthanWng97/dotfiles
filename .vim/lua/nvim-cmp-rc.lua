-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
--local luasnip = require 'luasnip'
local ultisnips = require 'cmp-nvim-ultisnips'.setup{}
--ultisnips.setup{}

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
   snippet = {
	 expand = function(args)
	   --require('luasnip').lsp_expand(args.body)
	   vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	 end,
   },
   mapping = {
	["<Tab>"] = cmp.mapping({
		c = function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			else
				cmp.complete()
			end
		end,
		i = function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
				vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
			else
				fallback()
			end
		end,
		s = function(fallback)
			if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
				vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
			else
				fallback()
			end
		end
	}),
	["<S-Tab>"] = cmp.mapping({
		c = function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
			else
				cmp.complete()
			end
		end,
		i = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
			elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
				return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
			else
				fallback()
			end
		end,
		s = function(fallback)
			if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
				return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
			else
				fallback()
			end
		end
	}),
	['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
	['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
	['<C-n>'] = cmp.mapping({
		c = function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
			end
		end,
		i = function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end
	}),
	['<C-p>'] = cmp.mapping({
		c = function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			else
				vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
			end
		end,
		i = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end
	}),
	['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
	['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
	['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
	['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
	['<CR>'] = cmp.mapping({
		i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
		c = function(fallback)
			if cmp.visible() then
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
			else
				fallback()
			end
		end
	}),
},
  sources = {
    { name = 'nvim_lsp' },
	{ name = 'ultisnips' },
    { name = 'cmp_tabnine' },
	{ name= 'buffer'},
  },
}
