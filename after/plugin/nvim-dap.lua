local dap = require("dap")
local mason_registry = require("mason-registry")
local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
local codelldb_path = codelldb_root .. "adaptor/codelldb"

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = codelldb_path,
        args = { "--port", "${port}" },
    }
}

dap.adapters.lldb = {
    name = "lldb",
    type = "executable",
    command = "/usr/bin/lldb",
}

dap.configurations.cpp = {
    {
        name = "Launch File",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
