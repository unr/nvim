-- disable netrw at the very start of your init.lua (strongly advised)
-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- TODO Add in prettier / autoformat support
-- TODO ensure vetur configs accurate, syntax+lang set proper for vue files

-- Packer Config
-- Config Information for Packer, https://github.com/wbthomason/packer.nvim#quickstart
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'

	-- setup telescope + plenary
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use { "catppuccin/nvim", as = "catppuccin" }

	-- improve syntax highlighting with treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- supposedly syntax highlighting broke recently, pinning commit for short term
	-- use { "nvim-treesitter/nvim-treesitter", commit = "fd4525fd9e61950520cea4737abc1800ad4aabb", run = ':TSUpdate' }

	-- setup lsp-config, mason
	use {
		'junnplus/lsp-setup.nvim',
		requires = {
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		}
	}

	use 'ggandor/lightspeed.nvim' -- improve motions
	use 'echasnovski/mini.nvim' -- add mini plugins
	use 'lukas-reineke/indent-blankline.nvim' -- show me where I am inline
	use 'romgrk/barbar.nvim' -- setup bufferline
	use 'nvim-lualine/lualine.nvim' -- lualine status line
	use 'akinsho/toggleterm.nvim' -- add floating/mini terms
	use 'lewis6991/gitsigns.nvim' -- set up git info in numbers col
	use 'folke/trouble.nvim' -- Getting into trouble

	-- Setup nvim tree
	use {
		'nvim-tree/nvim-tree.lua',
		tag = 'nightly'
	}

	-- trying to make it sexy
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	})
end)
-- You can do regular nvim stuff now
-- This plugin config should be abstracted to its own file, but not working?



local o = vim.o
local w = vim.wo
local b = vim.bo

local utils = require('utils')

-- <space> is our leader
vim.g.mapleader = ' '

b.autoindent = true
b.expandtab = false
b.softtabstop = 4
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = false

o.backspace = [[indent,eol,start]]
o.hidden = true
w.winfixwidth = true

o.splitbelow = true
o.splitright = true

w.cursorline = true
b.synmaxcol = 4000

w.number = true
w.relativenumber = true

-- I have some weird file format spacing stuff.... I assume
-- it has something to do with these.
-- w.list = true
-- if vim.fn.has('multi_byte') == 1 and vim.o.encoding == 'utf-8' then
-- 	o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
-- else
-- 	o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
-- end

w.colorcolumn = [[100]]
w.wrap = false

o.termguicolors = true

o.clipboard = [[unnamed,unnamedplus]]

o.scrolloff = 4

o.timeoutlen = 300

o.mouse = 'a'



-- Piano JK to exit Normal mode
utils.map('i', 'jk', "<ESC>", { noremap = true })
utils.map('i', 'kj', "<ESC>", { noremap = true })

-- Custom Leader bindings
utils.map('n', '<leader>w', "<cmd> w <CR>", { noremap = true }) -- save file
utils.map('n', '<leader>n', "<cmd> set rnu! <CR>", { noremap = true }) -- save file
utils.map('n', '<leader>ft', "<cmd>TroubleToggle<cr>", { noremap = true, silent = true }) -- save file

-- Easily navigate splits with ctrl
utils.map('n', '<C-h>', "<C-w>h", { noremap = true })
utils.map('n', '<C-j>', "<C-w>j", { noremap = true })
utils.map('n', '<C-k>', "<C-w>k", { noremap = true })
utils.map('n', '<C-l>', "<C-w>l", { noremap = true })

-- While typing, navigate mini.completion via tab
utils.map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
utils.map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

-- Swap forward/backwards in buffers
utils.map('n', '<Tab>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
utils.map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
-- Close buffer
utils.map('n', '<leader>x', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
-- Goto buffer in position...
utils.map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true })
utils.map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true })
utils.map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true })
utils.map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true })
utils.map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true })
utils.map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true })
utils.map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true })
utils.map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true })
utils.map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true })
utils.map('n', '<leader>0', '<Cmd>BufferLast<CR>', { noremap = true, silent = true })

-- Spawn various Telescope windows with leader f
utils.map('n', '<leader>ff', "<cmd> Telescope find_files <CR>", { noremap = true })
utils.map('n', '<leader>fa', "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { noremap = true })
utils.map('n', '<leader>fw', "<cmd> Telescope live_grep <CR>", { noremap = true })
utils.map('n', '<leader>fb', "<cmd> Telescope buffers <CR>", { noremap = true })
utils.map('n', '<leader>fh', "<cmd> Telescope help_tags <CR>", { noremap = true })
utils.map('n', '<leader>fo', "<cmd> Telescope oldfiles <CR>", { noremap = true })
utils.map('n', '<leader>fk', "<cmd> Telescope keymaps <CR>", { noremap = true })
utils.map('n', '<leader>fc', "<cmd> Telescope git_commits <CR>", { noremap = true })
utils.map('n', '<leader>fg', "<cmd> Telescope git_status <CR>", { noremap = true })


-- ESC Should clear highlights
-- Due to my old man hands, I also like <leader><CR> here
utils.map('n', '<ESC>', "<cmd> noh <CR>", { noremap = true })
utils.map('n', '<leader><CR>', "<cmd> noh <CR>", { noremap = true })

-- Open nvim-tree with ctrl n
utils.map('n', '<C-n>', "<cmd> NvimTreeToggle <CR>", { noremap = true })


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


-- start pretty ui
-- https://github.com/folke/noice.nvim#%EF%B8%8F-configuration
require("noice").setup({
	cmdline = {
		format = {
			cmdline = { icon = "" },
			search_down = { icon = " " },
			search_up = { icon = " " },
			help = { icon = "" },
		},
	},
	-- trying to hide the scanning tags alert
	routes = {
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "written",
			},
			opts = { skip = true },
		},
	},
})

-- Configure Nvim-Tree https://github.com/nvim-tree/nvim-tree.lua
-- TODO move this to it's own file eventually
require("nvim-tree").setup({
	view = {
		-- side = "right",
		float = { enable = true },
	}
})



-- Enable mini.nvim plugins
-- Adding the ability manipulate surrounding, via <leader>s {action}
-- Previously I had this mapped to S, however that is now lightspeed
require('mini.surround').setup({
	mappings = {
		add = '<leader>sa', -- Add surrounding in Normal and Visual modes
		delete = '<leader>sd', -- Delete surrounding
		find = '<leader>sf', -- Find surrounding (to the right)
		find_left = '<leader>sF', -- Find surrounding (to the left)
		highlight = '<leader>sh', -- Highlight surrounding
		replace = '<leader>sr', -- Replace surrounding
		update_n_lines = '<leader>sn', -- Update `n_lines`
	},
})

-- Allow comment toggling with gcc
require('mini.comment').setup()

-- highlight words under cursor
require('mini.cursorword').setup()

-- show me the indent scope
-- require('mini.indentscope').setup()
require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})

-- automatically add closing characters
require('mini.pairs').setup()

-- enable simple start page
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-starter.md#default-config
require('mini.starter').setup({
	header = "hello unr, time to code",
	footer = "❤"
})

-- minimal autocomplete, coq.nvim was annoying AF
require('mini.completion').setup({})


-- setup lualine
-- https://github.com/nvim-lualine/lualine.nvim#default-configuration
require('lualine').setup({
	options = {
		theme = "catppuccin"
	}
})



-- Setting up Git :)
require('gitsigns').setup()


-- Support for terminals
-- TODO determine why the f this opens/closes on press of enter???
-- require("toggleterm").setup({
-- 	close_on_exit = false,
-- 	insert_mappings = false,
-- 	terminal_mappings = false,
-- })
-- ctrl-f       Floating Terminal
-- ctrl-t       Vertical Terminal
-- ctrl-m       Horizontal Terminal
-- utils.map('n', '<C-f>', "<cmd> ToggleTerm size=20 direction=float <CR>", { noremap = true })
-- utils.map('n', '<C-t>', "<cmd> ToggleTerm size=80 direction=vertical <CR>", { noremap = true })
-- utils.map('n', '<C-m>', "<cmd> ToggleTerm size=20 direction=horizontal <CR>", { noremap = true })
-- -- adding custom hotkeys to the terminal mode
-- function _G.set_terminal_keymaps()
-- 	local opts = { buffer = 0 }
-- 	-- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
-- 	-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
-- 	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
-- 	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
-- 	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
-- 	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
-- 	vim.keymap.set('t', '<C-f>', "<cmd> ToggleTermToggleAll <CR>", opts)
-- 	vim.keymap.set('t', '<C-m>', "<cmd> ToggleTermToggleAll <CR>", opts)
-- 	vim.keymap.set('t', '<C-t>', "<cmd> ToggleTermToggleAll <CR>", opts)
-- end
--
-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')


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



-- Configure LSP Servers, via lsp-config / mason
-- https://github.com/junnplus/lsp-setup.nvim#setup-structure
require('lsp-setup').setup({
	-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
	servers = {
		cssls = {},
		eslint = {},
		html = {},
		tsserver = {},
		marksman = {},
		sumneko_lua = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "require", "ipairs" },
					},
				},
			},
		},
		tailwindcss = {},
		vuels = {
			config = {
				css = {},
				emmet = {},
				html = {
					suggest = {}
				},
				javascript = {
					format = {}
				},
				stylusSupremacy = {},
				typescript = {
					format = {}
				},
				vetur = {
					completion = {
						autoImport = false,
						tagCasing = "camel",
						useScaffoldSnippets = true
					},
					format = {
						defaultFormatter = {
							js = "prettier",
							ts = "none"
						},
						defaultFormatterOptions = {},
						scriptInitialIndent = false,
						styleInitialIndent = false
					},
					useWorkspaceDependencies = false,
					validation = {
						script = true,
						style = true,
						template = true
					}
				}
			}
		},
		-- volar = {}, -- RUN WITH VUE3 IN FUTURE
		taplo = {},
		yamlls = {},
	}
})


-- When in trouble, investigate
-- https://github.com/folke/trouble.nvim#%EF%B8%8F-configuration
require("trouble").setup()



-- Customize Telescope, integrate FZF, steal nvchad theme
-- :Telescope find_files
require('telescope').setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			n = {
				["q"] = require("telescope.actions").close,
				["<C-j>"] = {
					require("telescope.actions").move_selection_next, type = "action",
					opts = { nowait = true, silent = true }
				},
				["<C-k>"] = {
					require("telescope.actions").move_selection_previous, type = "action",
					opts = { nowait = true, silent = true }
				}
			},
			i = {
				["<C-j>"] = {
					require("telescope.actions").move_selection_next, type = "action",
					opts = { nowait = true, silent = true }
				},
				["<C-k>"] = {
					require("telescope.actions").move_selection_previous, type = "action",
					opts = { nowait = true, silent = true }
				}
			},
		},
	},

	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		}
	},
	extensions_list = { "themes", "terms" },
})
-- ENABLE FZF INTEGRATION
require('telescope').load_extension('fzf')
