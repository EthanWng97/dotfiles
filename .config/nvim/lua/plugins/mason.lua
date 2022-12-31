local M = {
	"williamboman/mason.nvim",
}

M.tools = {
	"bash-language-server",
	"black",
	"clang-format",
	"clangd",
	"codelldb",
	"codespell",
	"css-lsp",
	"eslint-lsp",
	"graphql-language-service-cli",
	"html-lsp",
	"jdtls",
	"json-lsp",
	"lua-language-server",
	"markdownlint",
	"prettier",
	"pyright",
	"shfmt",
	"stylua",
	"tailwindcss-language-server",
	"taplo",
	"typescript-language-server",
	"yaml-language-server",
}

function M.check()
	local mr = require("mason-registry")
	for _, tool in ipairs(M.tools) do
		local p = mr.get_package(tool)
		if not p:is_installed() then
			p:install()
		end
	end
end

function M.config()
	require("mason").setup({
		pip = {
			upgrade_pip = false,
		},
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
	M.check()
end

return M
