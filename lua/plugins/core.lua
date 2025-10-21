return {
  -- tweak original core settings, to apply catppuccin theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	opts = {
	-- 		inlay_hints = {
	-- 			enabled = false,
	-- 			exclude = { "vue", "ts", "js" }, -- filetypes for which you don't want to enable inlay hints
	-- 		},
	-- 	},
	-- },
}
