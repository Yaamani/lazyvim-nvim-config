return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      enable_cmp_source = vim.g.ai_cmp,
      virtual_text = {
        enabled = not vim.g.ai_cmp,
        map_keys = false, -- I mapped the keys myself in config/keymaps.lua
      },
    })
  end,
  -- opts = function(_, opts)
  --   require("codeium.util").get_newline = function()
  --     return "\n"
  --   end
  --   opts.virtual_text.key_bindings = {
  --     accept = "<M-k>",
  --     accept_word = "<M-l>",
  --     accept_line = "<M-j>",
  --   }
  -- end,
}
