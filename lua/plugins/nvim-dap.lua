return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      
      -- Apply this fix only on Windows
      if vim.fn.has("win32") == 1 then
        -- List of JavaScript debug adapters to fix
        local js_adapters = { 
          "pwa-node", 
          "pwa-chrome", 
          "pwa-msedge", 
          "node-terminal", 
          "pwa-extensionHost" 
        }

        for _, adapter in ipairs(js_adapters) do
          dap.adapters[adapter] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
              -- Explicitly use the .cmd extension
              command = "js-debug-adapter.cmd",
              args = { "${port}" },
            },
          }
        end
      end
    end,
  },
}
