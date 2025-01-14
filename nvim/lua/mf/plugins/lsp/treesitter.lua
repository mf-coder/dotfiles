-- Treesitter
--
-- Language parser
return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			modules = {},

			-- Wait for installation to finish befoer unlock UI
			sync_install = true,

			-- Do not automatically install missing parsers
			auto_install = false,

			-- Ignore the following parsers
			ignore_install = {},

			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},

			autotag = {
				enable = true,
			},

			ensure_installed = {
				"json",
				"bash",
				"lua",
				"vim",
				"git_config",
				"gitignore",
				"vimdoc",
				"c",
				"cpp",
				"make",
				"toml",
				"latex",
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
