-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("unr_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("vue"),
  pattern = { "vue" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.smartindent = false
  end,
})

-- Enable EslintFixAll when editing with volar
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = augroup("vue_eslint"),
--   command = "EslintFixAll",
-- })
