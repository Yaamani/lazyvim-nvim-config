return {
  "CopilotC-Nvim/CopilotChat.nvim",
  config = function(_, opts)
    local chat = require("CopilotChat")

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })

    opts.mappings = {
      reset = {
        normal = "<C-;>",
        insert = "<C-;>",
      },
    }

    chat.setup(opts)
  end,
}
