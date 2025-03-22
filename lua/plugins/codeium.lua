return {
  "Exafunction/codeium.nvim",
  opts = function(_, opts)
    require("codeium.util").get_newline = function()
      return "\n"
    end
  end,
}
