local opt = vim.opt

-- Indentation
opt.expandtab = false
opt.shiftwidth = 0
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true

-- Buffers
opt.hidden = true -- Buffer switching without saving

-- Search
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- But sensitive if includes capital letter
opt.grepprg = 'rg --ignore-case --vimgrep'
opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- Ignore some folders and files with find
opt.wildignore = {
    '**/node_modules/**',
    '**/.git/**',
    '**/.nuxt/**',
}

-- UI
opt.wrap = false
opt.linebreak = true -- Break lines by spaces or tabs

opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.signcolumn = 'yes'
opt.showmode = false

opt.termguicolors = true
opt.mouse = 'a'

opt.list = true
opt.listchars = {
    nbsp = '⦸', -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    tab = '  ',
    extends = '»', -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
    precedes = '«', -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
    trail = '·', -- Dot Operator (U+22C5)
}

-- Show cool character on line wrap
opt.showbreak = '↳ ' -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
opt.fillchars = {
    eob = ' ', -- Suppress ~ at EndOfBuffer
    fold = ' ', -- Hide trailing folding characters
}


opt.cursorline = true -- Highlight current line
opt.colorcolumn = { 121 } -- Highlight columns
opt.textwidth = 121 -- was set to 0, causing my text to randomly wrap while typing
opt.showmatch = true -- Highlight matching parenthesis, etc.

opt.cmdheight = 0

-- UX
opt.splitright = true -- Open new split to the right
opt.splitbelow = true -- Open new split below
opt.splitkeep = 'screen'
opt.whichwrap = opt.whichwrap + 'h,l,<,>,[,]'
opt.joinspaces = false -- Prevent inserting two spaces with J

-- Completion menu
opt.completeopt = { 'menuone', 'noselect' }
opt.pumheight = 13


-- Integration with the system clipboard
opt.clipboard = { 'unnamed', 'unnamedplus' }


-- Navigation
opt.scrolloff = 5 -- Lines to scroll when cursor leaves screen
opt.sidescrolloff = 3 -- Lines to scroll horizontally
opt.suffixesadd = { '.md', '.js', '.ts', '.tsx' } -- File extensions not required when opening with `gf`

-- Undo & History
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.shada = { '!', "'1000", '<50', 's10', 'h' } -- Increase the shadafile size so that history is longer
