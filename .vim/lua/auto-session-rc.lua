require('auto-session').setup{
	log_level = 'info',
	auto_session_enabled = true,
	auto_session_create_enabled = false,
	auto_save_enabled = true,
	auto_restore_enabled = true,
}

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
