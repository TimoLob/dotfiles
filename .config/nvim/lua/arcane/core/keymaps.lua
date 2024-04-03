local nnoremap = require("arcane.core.keymap_utils").nnoremap
local vnoremap = require("arcane.core.keymap_utils").vnoremap
local inoremap = require("arcane.core.keymap_utils").inoremap
local tnoremap = require("arcane.core.keymap_utils").tnoremap
local xnoremap = require("arcane.core.keymap_utils").xnoremap


local TERM = os.getenv("TERM")



local map = vim.keymap.set



-- TIP: Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

map("n","<leader>pv","<cmd>Neotree current<CR>")
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

-- Ctrl + S to save
map("n","<C-S>","<cmd>w<CR>", {silent=true})
map("i","<C-S>","<cmd>w<CR><ESC>", {silent=true})

-- Clear search highlightin
map("n", "C", ':let @/ = ""<CR>', { silent = true })

-- Telescope keybinds
map("n","<leader>ff","<cmd>Telescope find_files<cr>", {desc = "Fuzzy find files in cwd" })
map("n","<leader>fr","<cmd>Telescope oldfiles<cr>", {desc = "Fuzzy find recent files" })
map("n","<leader>fs","<cmd>Telescope live_grep<cr>", {desc = "Find string in cwd" })
map("n","<leader>fc","<cmd>Telescope grep_string<cr>", {desc = "Find string under cursor in cwd" })

-- Neotree
map("n","<leader>ee","<cmd>Neotree toggle<CR>", {desc = "Toggle neotree"})
