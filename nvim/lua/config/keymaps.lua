-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>bx", "<cmd>e ~/temp.md<cr>", { desc = "Open scratch buffer", remap = true })

-- delete default buffer cycle key
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

-- floating terminal
vim.keymap.set("n", "<leader>T", function() Snacks.terminal() end, { desc = "Terminal (cwd)", remap = true })
vim.keymap.set("n", "<leader>t", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)", remap = true })

