local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = true,
	sources = {
		-- formatter
		formatting.shfmt,
		formatting.stylua,
		formatting.prettier,
		formatting.clang_format,
		formatting.taplo,
		formatting.black,
		diagnostics.codespell,
		code_actions.gitsigns,
		-- diagnostics.cspell.with({
		--           disabled_filetypes = {"NvimTree"}
		--       }),
	},
})
