return {
  -- disable conform, see if it fixes vue
  -- { "stevearc/conform.nvim", enabled = false },
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        format = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_fallback = true, -- not recommended to change
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_fallback = true, -- not recommended to change
        },
        formatters_by_ft = {
          vue = { "eslint" },
        },
      }
      return opts
    end,
  },
}
