return {
  "zbirenbaum/copilot.lua",
  opts = function(_, opts)
    LazyVim.cmp.actions.ai_accept = function() end -- disable default accept action
    opts.suggestion.keymap = {
      -- accept = false,
      accept = "<M-k>",
      accept_word = "<M-l>",
      accept_line = "<M-j>",
      next = "<M-]>",
      prev = "<M-[>",
      -- dismiss = "<Tab>",
      dismiss = "<C-]>",
    }
  end,
}
