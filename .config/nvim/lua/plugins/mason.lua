local M = {
	"williamboman/mason.nvim",
}

local utils = require("utils")

function M.check()
	local mr = require("mason-registry")
	local packages = utils.mason_packages
	for _, package in ipairs(packages) do
		local p = mr.get_package(package)
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
