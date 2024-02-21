return {
  "mfussenegger/nvim-dap",
  dependencies = {
        "rcarriga/nvim-dap-ui"
  },
  -- lazy = true,
  config = function()
    local dap = require("dap")
    dap.adapters.rust = {
      type = 'server',
      port = "${port}",
      executable = {
        -- CHANGE THIS to your path!
        command = '/home/dominik/.local/share/nvim/mason/bin/codelldb',
        args = {"--port", "${port}"},
      }
    }

    local dapui = require("dapui")
    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"]=function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"]=function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"]=function()
      dapui.close()
    end
    require("dap.ext.vscode").load_launchjs(nil, {})
  end
}
