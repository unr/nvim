-- Setting up Catppuccin theme
require("catppuccin").setup({
	flavour = "mocha", -- mocha, macchiato, frappe, latte
	dim_inactive = {
		enabled = true,
		shade = "light",
		percentage = 0.25,
	},
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		lsp_trouble = true,
		barbar = true,
		mason = true,
		mini = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
})
vim.api.nvim_command "colorscheme catppuccin-mocha"
