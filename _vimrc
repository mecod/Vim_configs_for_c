set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab
" 用来打开list功能，显示不可见字符
nmap <leader>l :set list!<CR>
" 设置为>-格式,用$结尾
set listchars=tab:>-,eol:$

set nu!
colorscheme desert
syntax enable
syntax on

set tags=tags;
set autochdir

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr> 

let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1 

nnoremap <silent> <F12> :A<CR>

nnoremap <silent> <F3> :Grep<CR> 

