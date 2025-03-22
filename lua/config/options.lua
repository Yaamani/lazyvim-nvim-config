-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- disable autoformat on save
vim.g.autoformat = false

-- ai_cmp
vim.g.ai_cmp = false

-- startify
-- startify
vim.g.startify_session_persistence = 1
-- vim.g.startify_change_to_dir = 0
-- vim.g.startify_session_delete_buffers = 0
vim.g.startify_lists = {
  { ['type'] = 'sessions',  ['header'] = {'   Sessions'} },
  { ['type'] = 'files',     ['header'] = {'   MRU'} },
  { ['type'] = 'dir',       ['header'] = {'   MRU ' .. vim.fn.getcwd()} },
  { ['type'] = 'bookmarks', ['header'] = {'   Bookmarks'} },
  { ['type'] = 'commands',  ['header'] = {'   Commands'} },
}

-- suda
require("../plugins/vim-suda")
if SudaEnabled then
  vim.g["suda#noninteractive"] = 1
end
