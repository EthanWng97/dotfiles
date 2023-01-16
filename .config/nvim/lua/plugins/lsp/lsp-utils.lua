local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.setup = function()
	vim.diagnostic.config({
		virtual_text = false,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
		signs = true,
		underline = true,
		update_in_insert = true,
		severity_sort = false,
	})

	---- sign column
	local signs = require("utils").lsp_signs

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

M.on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", bufopts)
	vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", bufopts)
	vim.keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", bufopts)
	vim.keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>", bufopts)
	vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	-- show diagnostics in hover window
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end

return M
