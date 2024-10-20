-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader><space>", "<cmd>Telescope commands<cr>", { desc = "Commands", remap = true })
vim.keymap.set("n", "<C-t>", "<cmd>1po", { desc = "Jump out", remap = true })
vim.keymap.set("n", "<leader>bx", "<cmd>e ~/temp<cr>", { desc = "Open scratch buffer", remap = true })
