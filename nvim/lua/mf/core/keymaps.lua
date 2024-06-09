-- Setup
local keymap = vim.keymap
vim.g.mapleader = " "

-- General
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
keymap.set("n", "<leader>md", ":!glow %<CR>", { desc = "Preview markdown" })

-- Splitting
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Custom split navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
