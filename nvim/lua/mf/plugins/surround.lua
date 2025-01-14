-- Surround
--
-- Modify around text (ys motion command)
return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	config = true,
}
