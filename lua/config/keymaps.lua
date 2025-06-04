-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

map("n", "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", { desc = "Switch Window left" })
map("n", "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", { desc = "Switch Window right" })
map("n", "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", { desc = "Switch Window down" })
map("n", "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", { desc = "Switch Window up" })
