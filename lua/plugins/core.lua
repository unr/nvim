return {
  -- add catppuccin theme
  { "ellisonleao/gruvbox.nvim" },

  -- tweak original core settings, to appy catppuccin theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
