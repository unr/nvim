-- Enable mini.nvim plugins

-- Adding the ability manipulate surrounding, via <leader>s {action}
-- Previously I had this mapped to S, however that is now lightspeed
-- TODO investigate switching from lightspeed->leap, and switching back to vim-surround
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
-- I really think this is cute, but using indent_blankline for now
-- require('mini.indentscope').setup()

-- automatically add closing characters
require('mini.pairs').setup()

-- enable simple start page
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-starter.md#default-config
require('mini.starter').setup({
	header = "hello unr, time to code",
	footer = "❤"
})

-- minimal autocomplete, coq.nvim was annoying AF
-- require('mini.completion').setup({})
