local dap = require('dap')
local dapui = require('dapui')
-- dap.listeners.after.event_initialized["dapui_config"] =
--     function() dapui.open() end
-- dap.listeners.before.event_terminated["dapui_config"] =
--     function() dapui.close() end
-- dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

dap.adapters.codelldb = function(callback, config)
    -- specify in your configuration host = your_host , port = your_port
    callback({type = "server", host = '127.0.0.1', port = 13000})
end

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
                                'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true
    }
}
