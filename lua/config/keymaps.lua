-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Quality of life
-- Quality of life

--  jk & kj
vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true })

-- end of line & start of line
vim.keymap.set({ 'n', 'v', 'o' }, 'L', '$', { noremap = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'H', function()
  local cursor_column_position = vim.api.nvim_win_get_cursor(0)[2]
  local index_of_first_non_space_char = string.find(vim.api.nvim_get_current_line(), "%S")
  if index_of_first_non_space_char == nil then return '0' end
  if cursor_column_position < index_of_first_non_space_char then return '0' else return '^' end
end, { noremap = true, expr = true })

-- search
vim.keymap.set('v', '//', 'y/<C-R>=substitute(escape(@", \'/\\.*$^~[\'), \'\\_s\\+\', \'\\\\_s\\\\+\', \'g\')<CR><CR>N',
  { noremap = true })
vim.keymap.set('v', '/c',
  'y/\\C<C-R>=substitute(escape(@", \'/\\.*$^~[\'), \'\\_s\\+\', \'\\\\_s\\\\+\', \'g\')<CR><CR>Ncgn', { noremap = true })

-- source
vim.keymap.set('n', '<leader>x', ':so<CR>')

-- Terminal
-- Terminal
local function handle_term(term_map)
  if jit.os == "Windows" then
    local sh = vim.o.shell
    return [[:let &shell=executable('pwsh')?'pwsh':'powershell'<CR>]] .. term_map .. ":set shell=" .. sh .. "<CR>"
  else
    return term_map
  end
end

vim.keymap.set("n", jit.os ~= "OSX" and "<A-t>t" or "†t", handle_term(":term<CR>"))
vim.keymap.set("n", jit.os ~= "OSX" and "<A-t>j" or "†j", handle_term(":bel split +term<CR>"))
vim.keymap.set("n", jit.os ~= "OSX" and "<A-t>k" or "†k", handle_term(":split +term<CR>"))
vim.keymap.set("n", jit.os ~= "OSX" and "<A-t>l" or "†l", handle_term(":vsplit +term<CR>"))
vim.keymap.set("n", jit.os ~= "OSX" and "<A-t>h" or "†h", handle_term(":lefta vsplit +term<CR>"))

vim.keymap.set("n", jit.os ~= "OSX" and "<A-t>n" or "†n", ":tabnext<CR>")
vim.keymap.set("n", jit.os ~= "OSX" and "<A-t>p" or "†p", ":tabprevious<CR>")

vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "kj", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Gitsigns
-- Gitsigns
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { silent = true })
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { silent = true })
vim.keymap.set("n", "gph", ":Gitsigns preview_hunk<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "gsh", ":Gitsigns stage_hunk<CR>", { silent = true })
-- vim.keymap.set({ "n", "v" }, "grh", ":Gitsigns reset_hunk<CR>", { silent = true })

-- Diffview git
-- Diffview git
vim.keymap.set("n", "dvc", ":DiffviewClose<CR>", { silent = true })
vim.keymap.set("n", "dvo", ":DiffviewOpen<CR>", { silent = true })
vim.keymap.set("n", "dvh", ":DiffviewFileHistory %<CR>", { silent = true })
vim.keymap.set("n", "dvH", ":DiffviewFileHistory<CR>", { silent = true })

-- Bufferline
-- Bufferline
vim.keymap.set('n', jit.os ~= "OSX" and '<A-h>' or '˙', ':BufferLineCyclePrev<cr>', { noremap = true, silent = true, desc = "Prev buffer" })
vim.keymap.set('n', jit.os ~= "OSX" and '<A-l>' or '¬', ':BufferLineCycleNext<cr>', { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set('n', '<A-left>', ':BufferLineMovePrev<cr>', { noremap = true, silent = true, desc = "Move buffer prev" })
vim.keymap.set('n', '<A-right>', ':BufferLineMoveNext<cr>', { noremap = true, silent = true, desc = "Move buffer next" })

-- suda
-- suda
require("../plugins/vim-suda")
if SudaEnabled then
  vim.api.nvim_command("ASToggle")
  vim.api.nvim_set_keymap('n', '<C-s>', ':SudaWrite<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:SudaWrite<CR>i', { noremap = true })
  vim.api.nvim_set_keymap('v', '<C-s>', ':<C-u>SudaWrite<CR>', { noremap = true })
end

-- Windsurf (Codeium)
-- Windsurf (Codeium)
vim.keymap.set("i", "<M-k>", require("codeium.virtual_text").accept, { silent = true, expr = true, script = true, nowait = true })
vim.keymap.set("i", "<M-l>", require("codeium.virtual_text").accept_next_word, { silent = true, expr = true, script = true, nowait = true })
vim.keymap.set("i", "<M-j>", require("codeium.virtual_text").accept_next_line, { silent = true, expr = true, script = true, nowait = true })
vim.keymap.set("i", "<M-]>", function() require("codeium.virtual_text").cycle_completions(1) end, { silent = true })
vim.keymap.set("i", "<M-[", function() require("codeium.virtual_text").cycle_completions(-1) end, { silent = true })
