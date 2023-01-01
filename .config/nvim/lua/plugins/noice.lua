local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
}

function M.config()
	require("noice").setup({
		lsp = {
			override = {
				-- override the default lsp markdown formatter with Noice
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				-- override the lsp markdown formatter with Noice
				["vim.lsp.util.stylize_markdown"] = true,
				-- override cmp documentation with Noice (needs the other options to work)
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			command_palette = true,
			lsp_doc_border = true,
		},
	})
end

return M
