local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
	return
end

local status_ok, session_lens = pcall(require, "session-lens")
if not status_ok then
	return
end

local t_status_ok, telescope = pcall(require, "telescope")
if not t_status_ok then
	return
end

-- auto_session.setup({
-- 	auto_session_enabled = true,
-- 	auto_session_create_enabled = false,
-- 	bypass_session_save_file_types = { "alpha" },
-- })
auto_session.setup({
	log_level = "info",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = nil,
	auto_restore_enabled = nil,
	auto_session_use_git_branch = nil,
	-- the configs below are lua only
	bypass_session_save_file_types = { "alpha" },
  })

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,resize,winpos,terminal"

telescope.load_extension("session-lens")

session_lens.setup({
	-- path_display = { "shorten" },
})
