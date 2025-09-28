-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Escape alternatives - use jk to return to normal mode
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode", noremap = true, silent = true })
vim.keymap.set("v", "jk", "<ESC>", { desc = "Exit visual mode", noremap = true, silent = true })
vim.keymap.set("c", "jk", "<C-c>", { desc = "Exit command mode", noremap = true, silent = true })

-- Code Runner keybindings (similar to VS Code)
vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { desc = "Run Code", noremap = true, silent = false })
vim.keymap.set("n", "<F5>", ":RunCode<CR>", { desc = "Run Code (F5)", noremap = true, silent = false })
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { desc = "Run File", noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { desc = "Run Project", noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { desc = "Close Runner", noremap = true, silent = false })
