local dap = require("dap")

dap.adapters.lldb = {
    name = "lldb",
    type = "executable",
    command = "/usr/bin/lldb",
}

dap.configurations.cpp = {
    {
        name = "Launch File",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable", vim.fn.getcwd() .. "/", "file")
        end,
        args = {},
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        runInTerminal = false,
    }
}

dap.configurations.c = dap.configurations.cpp

local ExecTypes = {
  TEST = "cargo build --tests -q --message-format=json",
  BIN = "cargo build -q --message-format=json"
}

local function runBuild(type)
  local lines = vim.fn.systemlist(type)
  local output = table.concat(lines, "\n")
  local filename = output:match('^.*"executable":"(.*)",.*\n.*,"success":true}$')

  if filename == nil then
    return error("failed to build cargo project")
  end

  return filename
end

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.exepath("codelldb"), -- install `lldb` && use :Mason to install codelldb & cpptools
    args = { "--port", "${port}" },
  },
  name = "codelldb"
}

if vim.fn.has('win32') == 1 then
	dap.adapters.codelldb.executable.detached = false
end

dap.configurations.rust = {
  {
    name = "Debug Test",
    type = "codelldb",
    request = "launch",
    program = function ()
      return runBuild(ExecTypes.TEST)
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    showDisassembly = "never"
  },
  {
    name = "Debug Bin",
    type = "codelldb",
    request = "launch",
    program = function ()
      return runBuild(ExecTypes.BIN)
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    showDisassembly = "never"
  }
}
