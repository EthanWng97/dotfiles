local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
	return
end

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 10,
			position = "bottom",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "rounded", -- Border style. Can be "single", "double" or "rounded"
		mappings = { close = { "q", "<Esc>" } },
	},
	windows = { indent = 1 },
})

local cpptools = "/Users/navepnow/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters"
local codelldb = "/Users/navepnow/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = cpptools .. "/bin/OpenDebugAD7",
}

local port = 1300
dap.adapters.codelldb = {
	type = "server",
	port = "13000",
	executable = {
		-- CHANGE THIS to your path!
		command = codelldb,
		args = { "--port", "13000" },

		-- On windows you may have to uncomment this:
		-- detached = false,
	},
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		-- MIMode = "lldb",
		-- miDebuggerPath = cpptools .. "/lldb-mi/bin/lldb-mi",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		stopOnEntry = true,
	},
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.cmd([[
    nnoremap  <leader>d :lua require'dap'.continue()<CR>
    nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
    nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
    nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
    nnoremap <silent> <F9> :lua require'dap'.toggle_breakpoint()<CR>
]])
