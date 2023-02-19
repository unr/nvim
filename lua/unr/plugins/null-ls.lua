-- https://github.com/jayp0521/mason-null-ls.nvim
-- plugins.lsp should already have setup mason
require("null-ls").setup()
require("mason-null-ls").setup({
	ensure_installed = {
		"prettierd",
		"fixjson",
		"markdownlint",
		"stylelua"
	},
})
