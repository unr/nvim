local map = require('unr.utils').map

-- Input Mode

-- Piano JK to exit Normal mode
map('i', 'jk', "<ESC>", { noremap = true })
map('i', 'kj', "<ESC>", { noremap = true })

-- While typing, navigate mini.completion via tab
map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

-- Normal Mode

-- save file
map('n', '<leader>w', "<cmd> w <CR>", { noremap = true })
-- toggle relative line numbers
map('n', '<leader>n', "<cmd> set rnu! <CR>", { noremap = true })
-- toggle trouble
map('n', '<leader>ft', "<cmd>TroubleToggle<cr>", { noremap = true, silent = true })

-- Easily navigate splits with ctrl
map('n', '<C-h>', "<C-w>h", { noremap = true })
map('n', '<C-j>', "<C-w>j", { noremap = true })
map('n', '<C-k>', "<C-w>k", { noremap = true })
map('n', '<C-l>', "<C-w>l", { noremap = true })

-- Swap forward/backwards in buffers
map('n', '<Tab>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
-- Close buffer
map('n', '<leader>x', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
-- Goto buffer in position...
map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true })
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true })
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true })
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true })
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true })
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true })
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true })
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true })
map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true })
map('n', '<leader>0', '<Cmd>BufferLast<CR>', { noremap = true, silent = true })

-- Spawn various Telescope windows with leader f
map('n', '<leader>ff', "<cmd> Telescope find_files <CR>", { noremap = true })
map('n', '<leader>fa', "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { noremap = true })
map('n', '<leader>fw', "<cmd> Telescope live_grep <CR>", { noremap = true })
map('n', '<leader>fb', "<cmd> Telescope buffers <CR>", { noremap = true })
map('n', '<leader>fh', "<cmd> Telescope help_tags <CR>", { noremap = true })
map('n', '<leader>fo', "<cmd> Telescope oldfiles <CR>", { noremap = true })
map('n', '<leader>fk', "<cmd> Telescope keymaps <CR>", { noremap = true })
map('n', '<leader>fc', "<cmd> Telescope git_commits <CR>", { noremap = true })
map('n', '<leader>fg', "<cmd> Telescope git_status <CR>", { noremap = true })

-- ESC Should clear highlights
-- Due to my old man hands, I also like <leader><CR> here
map('n', '<ESC>', "<cmd> noh <CR>", { noremap = true })
map('n', '<leader><CR>', "<cmd> noh <CR>", { noremap = true })

-- Open nvim-tree with ctrl n
map('n', '<C-n>', "<cmd> NvimTreeToggle <CR>", { noremap = true })
