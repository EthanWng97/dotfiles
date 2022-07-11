local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
	return
end

auto_session.setup({
	auto_session_enabled = true,
	auto_session_create_enabled = false,
	-- the configs below are lua only
	bypass_session_save_file_types = { "alpha" },
})

vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,resize,winpos,terminal"

local status_ok, session_lens = pcall(require, "session-lens")
if not status_ok then
	return
end

session_lens.setup({
	-- path_display = { "shorten" },
})
