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
