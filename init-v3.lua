-- require 'impatient'

-- this nvim config concept stolen from JoosepAlviste
-- https://github.com/JoosepAlviste/dotfiles/blob/master/config/nvim/init.lua

local g = vim.g
local map = require('unr.utils').map

-- Map space to leader
map('n', '<space>', '<nop>')
map('v', '<space>', '<nop>')
g.mapleader = ' '
g.maplocalleader = '\\'


-- My custom configurations
require('unr.settings')
-- require 'unr.plugins'
-- require 'packer_compiled'
-- require 'unr.mappings'
