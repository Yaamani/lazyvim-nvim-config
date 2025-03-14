-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true })

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
vim.keymap.set({ "n", "v" }, "grh", ":Gitsigns reset_hunk<CR>", { silent = true })
