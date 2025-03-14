-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true })

-- Gitsigns
-- Gitsigns
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { silent = true })
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { silent = true })
vim.keymap.set("n", "gph", ":Gitsigns preview_hunk<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "gsh", ":Gitsigns stage_hunk<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "grh", ":Gitsigns reset_hunk<CR>", { silent = true })
