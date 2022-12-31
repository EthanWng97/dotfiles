local M = {
	"williamboman/mason.nvim",
}

local utils = require("utils")

M.tools = utils.mason_packages

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
