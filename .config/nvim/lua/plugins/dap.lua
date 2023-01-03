local M = {
    "mfussenegger/nvim-dap",
    enabled = false,

    dependencies = {
        {
            "rcarriga/nvim-dap-ui",

            config = function()
                require("dapui").setup()
            end,
        },
    },
}

function M.init()
    vim.keymap.set("n", "<leader>db", function()
        require("dap").toggle_breakpoint()
    end, { desc = "Toggle Breakpoint" })

    vim.keymap.set("n", "<leader>dc", function()
        require("dap").continue()
    end, { desc = "Continue" })

    vim.keymap.set("n", "<leader>do", function()
        require("dap").step_over()
    end, { desc = "Step Over" })

    vim.keymap.set("n", "<leader>di", function()
        require("dap").step_into()
    end, { desc = "Step Into" })

    vim.keymap.set("n", "<leader>dw", function()
        require("dap.ui.widgets").hover()
    end, { desc = "Widgets" })

    vim.keymap.set("n", "<leader>dr", function()
        require("dap").repl.open()
    end, { desc = "Repl" })

    vim.keymap.set("n", "<leader>du", function()
        require("dapui").toggle({})
        require("dapui").toggle({})
    end, { desc = "Dap UI" })

    vim.keymap.set("n", "<leader>ds", function()
        require("osv").launch({ port = 8086 })
    end, { desc = "Launch Lua Debugger Server" })

    vim.keymap.set("n", "<leader>dd", function()
        require("osv").run_this()
    end, { desc = "Launch Lua Debugger" })
end

function M.config()
    local dap = require("dap")
    local dapui = require("dapui")

    -- local cpptools = "/Users/navepnow/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters"
    -- local codelldb = "/Users/navepnow/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"
    local cpptools = "/Users/navepnow/.config/nvim/vimspector-config/gadgets/macos/vscode-cpptools/debugAdapters"
    local codelldb = "/Users/navepnow/.config/nvim/vimspector-config/gadgets/macos/CodeLLDB/adapter/codelldb"

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
            type = "cppdbg",
            request = "launch",
            MIMode = "lldb",
            miDebuggerPath = cpptools .. "/lldb-mi/bin/lldb-mi",
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
end

return M
