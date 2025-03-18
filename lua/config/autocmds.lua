-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Neotree refresh
-- Neotree refresh
local neotree_refresh_group = vim.api.nvim_create_augroup('NeoTreeRefresh', { clear = true })
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermLeave', 'TermClose', 'TabEnter' }, {
  callback = function(ev)
    local events = require("neo-tree.events")
    events.fire_event(events.GIT_EVENT) -- refresh neo-tree
  end,
  group = neotree_refresh_group,
  pattern = '*',
})

-- performance related autocmd
-- performance related autocmd
local large_files_disable_group = vim.api.nvim_create_augroup('LargeFilesDisable', { clear = true })
-- disable some features and plugins before loading file, this time the buffer is loaded but file is still not loaded
vim.api.nvim_create_autocmd("BufReadPre", {
  group = large_files_disable_group,
  pattern = "*",
  callback = function()
    vim.opt.spell = false
    require("illuminate").pause_buf()
  end,
})
-- after file is loaded, determine whether to enable the disabled features/plugins
vim.api.nvim_create_autocmd("BufReadPost", {
  group = large_files_disable_group,
  pattern = "*",
  callback = function()
    local max_filesize = 500 * 1204 -- 500 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if ok and stats and stats.size < max_filesize then
      vim.opt.spell = true
      require("illuminate").resume_buf()
    end
  end,
})
