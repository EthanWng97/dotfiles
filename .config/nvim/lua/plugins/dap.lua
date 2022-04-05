local dap = require('dap')
local dapui = require('dapui')

dapui.setup {
    icons = {expanded = "▾", collapsed = "▸"},
    mappings = {
        -- Use a table to apply multiple mappings
        expand = {"<CR>", "<2-LeftMouse>"},
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t"
    },
    sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
                id = "scopes",
                size = 0.25 -- Can be float or integer > 1 }, {id = "breakpoints", size = 0.25}
            -- { id = "stacks", size = 0.25 },
            -- { id = "watches", size = 00.25 },
        },
        size = 40,
        position = "right" -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = {}
        -- elements = { "repl" },
        -- size = 10,
        -- position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "rounded", -- Border style. Can be "single", "double" or "rounded"
        mappings = {close = {"q", "<Esc>"}}
    },
    windows = {indent = 1}
}

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/Users/navepnow/Desktop/vscode-cpptools/debugAdapters/bin/OpenDebugAD7'
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        MIMode = 'lldb',
        miDebuggerPath = '/Users/navepnow/Desktop/vscode-cpptools/debugAdapters/lldb-mi/bin/lldb-mi',
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
                                'file')
        end,
        stopOnEntry = true
    }
}

dap.listeners.after.event_initialized["dapui_config"] =
    function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] =
    function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end


vim.cmd[[
    " nnoremap  <A-d> :lua require'dap'.continue()<CR>
    " nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
    " nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
    " nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
    " nnoremap <silent> <F9> :lua require'dap'.toggle_breakpoint()<CR>
]]
