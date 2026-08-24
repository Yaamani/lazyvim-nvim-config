return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt_local.number = true
          vim.opt_local.relativenumber = true
        end,
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = false
      },
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        -- hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false, -- only works on Windows for hidden files/directories
      },
      -- Disables the file watcher to prevent Windows from constantly 
      -- triggering asynchronous redraws that reset your cursor.
      use_libuv_file_watcher = false,
    },
  }
}
