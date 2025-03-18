require("snacks")
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    ---@class snacks.scroll.Config
    scroll = {
      animate = {
        duration = { total = 100 },
        easing = "outSine",
      },
    },
    dashboard = {
      enabled = false,
    }
  },
}
