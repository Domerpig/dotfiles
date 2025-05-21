return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  -- lazy = true,
  config = function()
    local dap = require("dap")
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        -- CHANGE THIS to your path!
        command = "/home/dominik/.local/share/nvim/mason/bin/codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.zig = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
    local dapui = require("dapui")
    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    require("dap.ext.vscode").load_launchjs(nil, {})
  end,
}
