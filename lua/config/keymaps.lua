-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- used to toggle internal commands?
-- local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Piano JK to exit Normal mode
map("i", "jk", "<ESC>", { noremap = true, silent = true })
map("i", "kj", "<ESC>", { noremap = true, silent = true })

-- Eslint On Command
map("n", "<leader>ce", ":EslintFixAll<CR>", { desc = "Run EslintFixAll", remap = true })

-- save file
-- SADLY leaderw is used for window management in Lazy
-- map("n", "<leader>w", "<cmd> w <CR>", { noremap = true, silent = true })

-- When in vscode...
if vim.g.vscode then
-- launch lazygit plugin instead of normal version
  map("n", "<leader>gg", function()
    vim.fn.VSCodeNotify("lazygit.openLazygit")
  end, { desc = "LazyGit VSCode", remap = true })
  
  map("n", "<leader>e", function()
    vim.fn.VSCodeNotify("workbench.view.explorer")
  end, { desc = "Explorer VSCode", remap = true })
  
  map("n", "<C-s>", function()
    vim.fn.VSCodeNotify("workbench.action.files.save")
  end, { noremap = true, silent = true })
end
