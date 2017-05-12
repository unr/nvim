" Basic init for NVIM

" lots of deoplete + denite things to verify and steal from here
" https://github.com/rafi/vim-config

if &compatible
	set nocompatible
endif

" set dein runtime path (where you installed dein)
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.dein-nvim')
  call dein#begin('~/.dein-nvim')

  " how to add plugins in dein
  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Functional Add-ons
  " To use vimfiler how I want, need OG unite, not Denite
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('ap/vim-buftabline')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('mhinz/vim-startify')
  call dein#add('t9md/vim-choosewin')
  call dein#add('terryma/vim-expand-region')
  call dein#add('tpope/vim-surround')

  " Git Management
  call dein#add('airblade/vim-gitgutter')
  call dein#add('rhysd/committia.vim')

  " Autocomplete / Magic
  " ./install --all so the interactive script doesn't block
  " you can check the other command line options  in the install file
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/echodoc.vim')
  call dein#add('carlitux/deoplete-ternjs')
  " Feel like when I use tern_for_vim and deoplete, I get weird duplications
  " call dein#add('ternjs/tern_for_vim')

  " Language Related
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Raimondi/delimitMate')

  " Theming Plugins
  call dein#add('w0ng/vim-hybrid')

  " Utilities
  " call dein#add('hecal3/vim-leader-guide')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable



" @@ Absolute Basics

" Basic leader (using space, cuz spaceVim changed me)
let mapleader = "\<space>"

set modelines=0
set number
set ruler
set visualbell
set encoding=utf-8
scriptencoding utf-8

" basics of text formatting and whitespace
" TODO, while I have this set globally, need to autoCMD other lang settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set noshiftround
set nowrap

" Speed/Rendering tweaks
set ttyfast
set laststatus=2
set showmode
set showcmd

" Theme here
set background=dark
colorscheme hybrid
set guifont=Hack\ 20


" @@ Additional <leader> Feature
" use jk to escape insert mode
inoremap jk <esc>
inoremap kj <esc>

" use <leader>w to write
nmap <leader>w :w<Cr>



" @@ VimEasyMotion configs
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" keep cursor column when JK motion
let g:EasyMotion_startofline = 0 

" @@ Lightline, meant to replace Airline
let g:lightline = { 'colorscheme': 'seoul256' }

" @@ Buftabline comes in to help support Lightline
let g:buftabline_show = 2 " always
let g:buftabline_numbers = 2 " ordinal from left-to-right
" try to fix highlight colors for Hybrid colorscheme
hi! link BufTabLineCurrent Function
hi! BufTabLineFill guibg=#242424
hi! BufTabLineHidden guifg=#888888 guibg=#444444
hi! link BufTabLineActive Normal
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" @@ Customizing how FZF Searches
" Startify conflicted with FZF Files, turn off cd in startify
 let g:startify_change_to_dir = 0

" use FZF to find files
nmap <leader>f :FZF<Cr>

" use FZF to find in folder IN file with AG
nmap <leader>a :Ag!<Cr>

" use FZF to find Line in all loaded buffers
nmap <leader>s :Lines!<Cr>

" store per-function history
let g:fzf_history_dir = '~/.new-vim/share/fzf-history'

nmap <leader>b :Buffers<Cr>

" Insert mode completion
" TODO these are neat? Make them more useful
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" @@ Enable choose win on -
nmap  -  <Plug>(choosewin)

" @@ Vim Leader Guide
" TODO configure my mappings lol
" Should automatically display most predefined configs above, can add more below.
" https://github.com/hecal3/vim-leader-guide
" let g:lmap = {}

" By pressing Space, and waiting for timeoutlen, show guide
" call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
" nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
" vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>


" @@ VimFiler setup.
" Like 100% stolen from SpaceVim configs
noremap <silent> <F3> :VimFiler<CR>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = ''
let g:vimfiler_readonly_file_icon = '*'
let g:vimfiler_marked_file_icon = '√'
let g:vimfiler_ignore_pattern = [
  \ '^\.git$',
  \ '^\.DS_Store$',
  \ '\.class$'
  \]

"try
call vimfiler#custom#profile('default', 'context', {
      \ 'explorer' : 1,
      \ 'winwidth' : 25,
      \ 'winminwidth' : 30,
      \ 'toggle' : 1,
      \ 'auto_expand': 1,
      \ 'direction' : 'rightbelow',
      \ 'explorer_columns' : '',
      \ 'parent': 0,
      \ 'status' : 1,
      \ 'safe' : 0,
      \ 'split' : 1,
      \ 'hidden': 1,
      \ 'no_quit' : 1,
      \ 'force_hide' : 0,
      \ })

"catch
"endtry
augroup vfinit
  au!
  autocmd FileType vimfiler call s:vimfilerinit()
  autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'vimfiler') |
        \ q | endif
augroup END
function! s:vimfilerinit()
  setl nonumber
  setl norelativenumber

  silent! nunmap <buffer> <Space>
  silent! nunmap <buffer> <C-l>
  silent! nunmap <buffer> <C-j>
  silent! nunmap <buffer> E
  silent! nunmap <buffer> gr
  silent! nunmap <buffer> gf
  silent! nunmap <buffer> -
  silent! nunmap <buffer> s

  nnoremap <silent><buffer><expr> sg  vimfiler#do_action('vsplit')
  nnoremap <silent><buffer><expr> sv  vimfiler#do_action('split')
  nnoremap <silent><buffer><expr> st  vimfiler#do_action('tabswitch')
  nmap <buffer> '      <Plug>(vimfiler_toggle_mark_current_line)
  nmap <buffer> V      <Plug>(vimfiler_clear_mark_all_lines)
  nmap <buffer> i      <Plug>(vimfiler_switch_to_history_directory)
  nmap <buffer> <Tab>  <Plug>(vimfiler_switch_to_other_window)
  nmap <buffer> <C-r>  <Plug>(vimfiler_redraw_screen)
endf






" @@ OH GOD DEOPLETE
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_camel_case = 1
let g:deoplete#max_abbr_width = 35
let g:deoplete#max_menu_width = 20
let g:deoplete#skip_chars = ['(', ')', '<', '>']
let g:deoplete#tag#cache_limit_size = 800000
let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#sources#jedi#statement_length = 1
let g:deoplete#sources#jedi#show_docstring = 1


" Limit the sources used in deoplete
let g:deoplete#sources = get(g:, 'deoplete#sources', {})
let g:deoplete#sources.javascript = ['file', 'ternjs']
let g:deoplete#sources.jsx = ['file', 'ternjs']

" Ignore sources for deoplete
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:deoplete#ignore_sources.html = ['syntax']


" Custom function adjustments
call deoplete#custom#set('_', 'min_pattern_length', 1)


let g:deoplete#omni#functions = get(g:, 'deoplete#omni#functions', {})
let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
let g:deoplete#omni#functions.html = 'htmlcomplete#CompleteTags'
let g:deoplete#omni#functions.markdown = 'htmlcomplete#CompleteTags'
" let g:deoplete#omni#functions.javascript =
" \ [ 'tern#Complete', 'jspc#omni', 'javascriptcomplete#CompleteJS' ]

let g:deoplete#omni_patterns = get(g:, 'deoplete#omni_patterns', {})
let g:deoplete#omni_patterns.html = '<[^>]*'
" let g:deoplete#omni_patterns.javascript = '[^. *\t]\.\w*'
" let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%\(\h\w*\)\?'
let g:deoplete#omni_patterns.php =
  \ '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns', {})
let g:deoplete#omni#input_patterns.xml = '<[^>]*'
let g:deoplete#omni#input_patterns.md = '<[^>]*'
let g:deoplete#omni#input_patterns.css  = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.sass = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni#input_patterns.python = ''
let g:deoplete#omni#input_patterns.javascript = ''

" Ranking and Marks
" Default rank is 100, higher is better.
call deoplete#custom#set('buffer',        'mark', 'ℬ')
call deoplete#custom#set('tag',           'mark', '⌦')
call deoplete#custom#set('omni',          'mark', '⌾')
call deoplete#custom#set('ternjs',        'mark', '⌁')
call deoplete#custom#set('jedi',          'mark', '⌁')
call deoplete#custom#set('vim',           'mark', '⌁')
call deoplete#custom#set('neosnippet',    'mark', '⌘')
call deoplete#custom#set('around',        'mark', '⮀')
call deoplete#custom#set('syntax',        'mark', '♯')
call deoplete#custom#set('tmux-complete', 'mark', '⊶')

call deoplete#custom#set('vim',           'rank', 630)
call deoplete#custom#set('ternjs',        'rank', 620)
call deoplete#custom#set('jedi',          'rank', 610)
call deoplete#custom#set('omni',          'rank', 600)
call deoplete#custom#set('neosnippet',    'rank', 510)
call deoplete#custom#set('member',        'rank', 500)
call deoplete#custom#set('file_include',  'rank', 420)
call deoplete#custom#set('file',          'rank', 410)
call deoplete#custom#set('tag',           'rank', 400)
call deoplete#custom#set('around',        'rank', 330)
call deoplete#custom#set('buffer',        'rank', 320)
call deoplete#custom#set('dictionary',    'rank', 310)
call deoplete#custom#set('tmux-complete', 'rank', 300)
call deoplete#custom#set('syntax',        'rank', 200)


" Matchers and converters
" Default sorters: ['sorter_rank']
" Default matchers: ['matcher_length', 'matcher_fuzzy']

call deoplete#custom#set('_', 'converters', [
  \ 'converter_remove_paren',
  \ 'converter_remove_overlap',
  \ 'converter_truncate_abbr',
  \ 'converter_truncate_menu',
  \ 'converter_auto_delimiter',
  \ ])

" Keymappings and Events

" some magic autocmd from where I stole this... dunno if I need?
" autocmd MyAutoCmd CompleteDone * pclose!

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

" Undo completion
inoremap <expr><C-g> deoplete#undo_completion()

" Redraw candidates
inoremap <expr><C-l> deoplete#refresh()

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
imap <silent><expr><CR> pumvisible() ?
  \ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#close_popup())
    \ : (delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : "\<CR>")

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : (<SID>is_whitespace() ? "\<Tab>"
  \ : deoplete#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : (<SID>is_whitespace() ? "\<Tab>"
  \ : deoplete#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace() 
  let col = col('.') - 1
  return ! col || getline('.')[col - 1] =~? '\s'
endfunction 


" @@ Configuring deoplete-ternjs to use deoplete
" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]





