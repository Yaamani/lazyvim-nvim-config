-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- disable autoformat on save
vim.g.autoformat = false

-- picker
vim.g.lazyvim_picker = "telescope"

-- ai_cmp
vim.g.ai_cmp = false

-- windows and splits
vim.o.splitright = true
vim.o.equalalways = false

-- viminfo file to store command history, marks, etc.
vim.o.viminfo = "'100,n$HOME/.viminfo"

-- startify
-- startify
vim.o.sessionoptions = "globals," .. vim.o.sessionoptions -- To save the sort order for bufferline (:help bufferline)
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

-- Spell
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.opt.spelloptions = 'camel'

-- suda
require("../plugins/vim-suda")
if SudaEnabled then
  vim.g["suda#noninteractive"] = 1
end
