-- Mason
--
-- Language servers for neovim
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"lua_ls",
				"clangd",
				"cmake",
				"jsonls",
				"pyright",
				"marksman",
				"taplo",
				"rust_analyzer",
				"yamlls",
				"bashls",
				"asm_lsp",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"clang-format",
				"asmfmt",
				"shfmt",
				"taplo",
				"eslint_d",
				"pylint",
				"cmakelint",
				"shellcheck",
			},
		})
	end,
}
