vim.g.mapleader = " "

vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>")

-- This unsets the "last search pattern" register by hitting return
vim.keymap.set("n", "<CR>", ":noh<CR><CR>")

-- block jump using curly braces
vim.keymap.set("n", "<silent> <S-j>", "}")
vim.keymap.set("n", "<silent> <S-k>", "{")

vim.keymap.set("i", "<C-c>", "<Esc>")

-- move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- use leader + o to insert a new line without entering insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader><S-o>", "O<Esc>")

-- copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+y')

vim.keymap.set("n", "<leader>v", ":vsplit | wincmd l<CR>")
