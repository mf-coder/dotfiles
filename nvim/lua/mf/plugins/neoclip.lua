-- Neoclip
--
-- Clipboard manager
return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
		{ "kkharji/sqlite.lua", module = "sqlite" },
	},
	config = function()
		require("neoclip").setup({
			history = 50,
			enable_persistent_history = true,
		})
	end,
}
