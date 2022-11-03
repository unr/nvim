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
