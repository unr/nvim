-- Autocommand setups



-- Issues with latest treesitter, trying to solve it with this random autocmd from reddit
-- https://www.reddit.com/r/neovim/comments/yl8lt2/no_automatic_html_syntax_highlighting_on_vue_files/iuxnik3/
vim.api.nvim_create_autocmd("BufEnter", { callback = function() vim.cmd [[syntax on]] end })

