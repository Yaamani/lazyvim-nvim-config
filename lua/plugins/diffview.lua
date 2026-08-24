return {
  "sindrets/diffview.nvim",
  opts = {
    hooks = {
      view_opened = function(view)
        local previous_tabnr = vim.fn.tabpagenr("#")
        local tabs = vim.api.nvim_list_tabpages()
        view.origin_tabpage = tabs[previous_tabnr]
      end,
      view_closed = function(view)
        local origin_tabpage = view.origin_tabpage
        vim.schedule(function()
          if origin_tabpage and vim.api.nvim_tabpage_is_valid(origin_tabpage) then
            vim.api.nvim_set_current_tabpage(origin_tabpage)
          end
        end)
      end,
    },
    view = {
      -- Configure the layout and behavior of different types of views.
      -- Available layouts:
      --  'diff1_plain'
      --    |'diff2_horizontal'
      --    |'diff2_vertical'
      --    |'diff3_horizontal'
      --    |'diff3_vertical'
      --    |'diff3_mixed'
      --    |'diff4_mixed'
      -- For more info, see |diffview-config-view.x.layout|.
      default = {
        -- Config for changed files, and staged files in diff views.
         layout = "diff2_horizontal",
        winbar_info = false, -- See |diffview-config-view.x.winbar_info|
      },
      merge_tool = {
        -- Config for conflicted files in diff views during a merge or rebase.
        layout = "diff3_mixed",
        disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
        winbar_info = true, -- See |diffview-config-view.x.winbar_info|
      },
      file_history = {
        -- Config for changed files in file history views.
        layout = "diff2_horizontal",
        winbar_info = false, -- See |diffview-config-view.x.winbar_info|
      },
    },
  },
}
