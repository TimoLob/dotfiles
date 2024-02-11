-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

-- Ctrl + Z and Ctrl + Y Undo/Redo
map("n", "<C-Z>", "u")
map("n", "<C-Y>", "<C-R>")
map("i", "<C-Z>", "<C-O>u")
map("i", "<C-Y>", "<C-O><C-R>")

-- Surround current word in curly {}
map("n", "<F5>", "bi{<ESC>ea}<ESC>")

-- Use ctrl + [hjkl] to select the active split
map("n", "<C-K>", ":wincmd k<CR>", { silent = true })
map("n", "<C-J>", ":wincmd j<CR>", { silent = true })
map("n", "<C-H>", ":wincmd h<CR>", { silent = true })
map("n", "<C-L>", ":wincmd l<CR>", { silent = true })

map("n", "<C-UP>", ":wincmd k<CR>", { silent = true })
map("n", "<C-DOWN>", ":wincmd j<CR>", { silent = true })
map("n", "<C-LEFT>", ":wincmd h<CR>", { silent = true })
map("n", "<C-RIGHT>", ":wincmd l<CR>", { silent = true })

-- Split mvovement using ctrl + movement in terminal mode
map("t", "<C-K>", "<cmd>wincmd k<CR>", { silent = true })
map("t", "<C-J>", "<cmd>:wincmd j<CR>", { silent = true })
map("t", "<C-H>", "<cmd>:wincmd h<CR>", { silent = true })
map("t", "<C-L>", "<cmd>:wincmd l<CR>", { silent = true })

map("t", "<C-UP>", "<cmd>wincmd k<CR>", { silent = true })
map("t", "<C-DOWN>", "<cmd>:wincmd j<CR>", { silent = true })
map("t", "<C-LEFT>", "<cmd>:wincmd h<CR>", { silent = true })
map("t", "<C-RIGHT>", "<cmd>:wincmd l<CR>", { silent = true })

map("n", "C", ':let @/ = ""<CR>', { silent = true })
