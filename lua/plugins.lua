-- Config Information for Packer, https://github.com/wbthomason/packer.nvim#quickstart

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
end)
