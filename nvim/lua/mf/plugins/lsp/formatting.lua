-- Formatting
--
-- LSP formatter
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				c = { "clang-format" },
				rust = { "rustfmt" },
				asm = { "asmfmt" },
				bash = { "shfmt" },
				toml = { "taplo" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		conform.formatters.rustfmt = {
			options = {
				default_edition = "2021",
			},
		}
	end,
}
