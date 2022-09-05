-- Create an autocmd User PackerCompileDone to update it every time packer is compiled
vim.api.nvim_create_autocmd("User", {
	pattern = "PackerCompileDone",
	callback = function()
		vim.cmd("CatppuccinCompile")
		vim.defer_fn(function()
			vim.cmd("colorscheme catppuccin")
		end, 50) -- Debounced for live reloading
	end,
})

-- PackerCompile on save assuming your plugin spefication file is in plugins.lua or catppuccin.lua
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "plugins.lua", "colorscheme.lua" },
	callback = function()
		vim.cmd("PackerCompile")
	end,
})
