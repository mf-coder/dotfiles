-- Setup
local keymap = vim.keymap
vim.g.mapleader = " "

-- General
keymap.set("n", "<leader>nn", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
keymap.set("n", "<leader>qa", ":qa<CR>", { desc = "Write and close all buffers" })

-- Splitting
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Split navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })

-- Better navigation
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center line" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center line" })
keymap.set("n", "n", "nzz", { desc = "Go to next result and center line" })
keymap.set("n", "N", "Nzz", { desc = "Go to previous result and center line" })
