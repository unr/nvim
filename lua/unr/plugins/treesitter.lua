-- Setup TreeSitter configs
require('nvim-treesitter.configs').setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"bash",
		"css",
		"git_rebase",
		"gitignore",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"php",
		"regex",
		"vue",
		"yaml",
	},
})
