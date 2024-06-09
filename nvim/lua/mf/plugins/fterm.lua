-- fterm
--
-- Floating terminal for neovim
return {
	"numToStr/FTerm.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>/", "<cmd>lua require('FTerm').toggle()<CR>", { desc = "Toggle floating terminal" })
		keymap.set("t", "<leader>/", "<cmd>lua require('FTerm').toggle()<CR>", { desc = "Toggle floating terminal" })
	end,
}
