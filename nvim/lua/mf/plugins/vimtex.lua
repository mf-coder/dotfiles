-- Vimtex
--
-- Automatically compile LaTeX documents
return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"
	end,
}
