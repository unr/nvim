-- Installs all plugins via packer, though they have their own config files.
-- Borroed from https://github.com/JoosepAlviste/dotfiles/blob/master/config/nvim/lua/j/plugins.lua

local fn = vim.fn

-- Automatically install packer.nvim
local install_path = fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
end

vim.cmd.packadd 'packer.nvim'

return require('packer').startup {
    function(use)
        -- Packer itself
        use { 'wbthomason/packer.nvim', opt = true }

        -- make things load fast apparently
        use 'lewis6991/impatient.nvim'

        -- Every one using nvim-web-devicons these days
        use 'kyazdani42/nvim-web-devicons'

        -- Telescope support
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                require 'unr.plugins.telescope'
            end,
        }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        -- Colorscheme
        use {
            "catppuccin/nvim",
            as = "catppuccin",
           config = function()
                require 'unr.plugins.catppuccin'
            end,
        }

        -- improve syntax highlighting with treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            commit = '4cccb6f494eb255b32a290d37c35ca12584c74d0',
            run = ':TSUpdate',
            config = function()
                require 'unr.plugins.treesitter'
            end,
        }
        -- supposedly syntax highlighting broke recently, pinning commit for short term
        -- use { "nvim-treesitter/nvim-treesitter", commit = "fd4525fd9e61950520cea4737abc1800ad4aabb", run = ':TSUpdate' }

        -- TODO setup lsp
        -- setup lsp-config, mason
        use {
            'junnplus/lsp-setup.nvim',
            requires = {
                'neovim/nvim-lspconfig',
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
            },
            config = function()
                require 'unr.plugins.lsp'
            end,
        }


        -- Getting into trouble
        use {
            'folke/trouble.nvim',
            config = function()
                require 'unr.plugins.trouble'
            end
        }

        -- show me where I am inline
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require 'unr.plugins.indent_blankline'
            end
        }

        -- set up mini plugins
        use {
            'echasnovski/mini.nvim',
            config = function()
                require 'unr.plugins.mini'
            end
        }

        -- set up git info in numbers col
        use {
            'lewis6991/gitsigns.nvim',
            config = function()
                require 'unr.plugins.gitsigns'
            end
        }

        -- lualine status line
        use {
            'nvim-lualine/lualine.nvim',
            config = function()
                require 'unr.plugins.lualine'
            end
        }

        -- add floating/mini terms
        use {
            'akinsho/toggleterm.nvim',
            config = function()
                require 'unr.plugins.toggleterm'
            end
        }

        -- Setup nvim tree
        use {
            'nvim-tree/nvim-tree.lua',
            tag = 'nightly',
            config = function()
                require 'unr.plugins.nvim_tree'
            end
        }

        -- trying to make it sexy
        use({
            "folke/noice.nvim",
            requires = {
                "MunifTanjim/nui.nvim",
                "rcarriga/nvim-notify",
            },
            config = function()
                require 'unr.plugins.noice'
            end
        })

        use 'ggandor/lightspeed.nvim' -- improve motions
        use 'romgrk/barbar.nvim' -- setup bufferline

        -- Automatically set up your configuration after cloning packer.nvim
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        -- Move to lua dir so impatient.nvim can cache it
        compile_path = vim.fn.stdpath 'config' .. '/lua/packer_compiled.lua',
    },
}
