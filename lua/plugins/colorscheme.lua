-- kitty's default colors

-- #: black
vim.g.terminal_color_0 = "#000000"
vim.g.terminal_color_8 = "#767676"
-- #: red
vim.g.terminal_color_1 = "#cc0403"
vim.g.terminal_color_9 = "#f2201f"
-- #: green
vim.g.terminal_color_2 = "#19cb00"
vim.g.terminal_color_10 = "#23fd00"
-- #: yellow
vim.g.terminal_color_3 = "#cecb00"
vim.g.terminal_color_11 = "#fffd00"
-- #: blue
vim.g.terminal_color_4 = "#0d73cc"
vim.g.terminal_color_12 = "#1a8fff"
-- #: magenta
vim.g.terminal_color_5 = "#cb1ed1"
vim.g.terminal_color_13 = "#fd28ff"
-- #: cyan
vim.g.terminal_color_6 = "#0dcdcd"
vim.g.terminal_color_14 = "#14ffff"
-- #: white
vim.g.terminal_color_7 = "#dddddd"
vim.g.terminal_color_15 = "#ffffff"

return {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      local vsc = require("vscode.colors").get_colors()
      require("vscode").setup({
        -- transparent = true,
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          -- ['@constant.builtin'] = { fg = vsc.vscBlue, bg = vsc.vscNone },
          -- ['@variable.builtin'] = { fg = vsc.vscBlue, bg = vsc.vscNone },
          -- ['Type'] = { fg = vsc.vscBlueGreen, bg = vsc.vscNone },
          -- ['Typedef'] = { fg = vsc.vscBlueGreen, bg = vsc.vscNone },
          -- ['@type'] = { fg = vsc.vscBlueGreen, bg = vsc.vscNone },
          -- ['@type.builtin'] = { fg = vsc.vscBlueGreen, bg = vsc.vscNone },
          -- ['@type.qualifier'] = { fg = vsc.vscBlueGreen, bg = vsc.vscNone },
          ["DiagnosticUnnecessary"] = { fg = "#888888", bg = vsc.vscNone, undercurl = true, sp = vsc.vscBlue },
          ["SpellBad"] = { undercurl = true, sp = vsc.vscBlueGreen },
          ["SpellCap"] = { undercurl = true, sp = vsc.vscGray },
          ["SpellRare"] = { undercurl = true, sp = vsc.vscGray },
          ["SpellLocal"] = { undercurl = true, sp = vsc.vscGray },
          ["NeoTreeDotfile"] = { fg = "#626262", bg = vsc.vscNone },
          ["NeoTreeDimText"] = { fg = "#626262", bg = vsc.vscNone },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
