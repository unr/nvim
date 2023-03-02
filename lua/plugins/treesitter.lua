return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
      },
    },
  },
}
