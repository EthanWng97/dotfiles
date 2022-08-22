local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

hop.setup({})

-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap("", "s", "<cmd>lua require'hop'.hint_char1()<cr>", {})
