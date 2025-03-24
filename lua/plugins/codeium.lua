return {
  "Exafunction/codeium.nvim",
  opts = function(_, opts)
    require("codeium.util").get_newline = function()
      return "\n"
    end
    opts.virtual_text.key_bindings = {
      accept = "<M-k>",
      accept_word = "<M-l>",
      accept_line = "<M-j>",
    }
  end,
}
