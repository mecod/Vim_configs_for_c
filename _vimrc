set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
" => 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
" 设置vim存储的历史命令记录的条数
set history=700

" 按编程语言的语法，对代码进行色彩标示，术语叫做语法高亮
" syntax enable
" 清除语法高亮, syntax clear
" set syntax=off
syntax on

" 显示行数标示
set number

" 打开状态栏的坐标信息
set ruler

" 取消底部状态栏显示。1为关闭，2为开启
" 0: never
" 1: only if there are at least two windows
" 2: always
set laststatus=2
set statusline=%.45F\ %m\%=\|%{&fileencoding?&fileencoding:&encoding}\|%{&fileformat}\|%{&filetype}\ %4l,%c\

" 将输入的命令显示出来，便于查看当前输入的信息
set showcmd

" 设置魔术匹配控制，可以通过:h magic查看更详细的帮助信息
set magic

" 高亮显示坐标所在行
set cursorline

" 插入右括号时会短暂地跳转到匹配的左括号
set showmatch

" 不对匹配的括号进行高亮显示
let loaded_matchparen = 1

" 高亮显示搜索匹配到的字符串
set hlsearch
" 在搜索模式下，逐字匹配
set incsearch
" 搜索时忽略大小写
set ignorecase
" 搜索时如果输入大写字符，则忽略上面ignorecase的设置
set smartcase

" 文本显示时，一个tab对应4个空格
set tabstop=4
" Number of spaces to use for each step of (auto)indent.  Used for
" 'cindent', >>, <<, etc.
" 自动缩进时，每个缩进尺度
set shiftwidth=4
" smarttab on在行首输入tab时，插入的空格数以shiftwidth为准
" smarttab off在行首输入tab时，插入的空格数以tabstop或softtabstop数为准
set smarttab
" 在按退格键时，如果前面满足4个空格，则会一次性清除
set softtabstop=4
" 键盘上按tab键，实际输入tabstop个空格
set expandtab

" 在执行宏命令时，不进行实时重绘；
" 在宏命令执行完成后，一次性重绘，以便提高性能。
set lazyredraw

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

map <leader>b wbi{<Esc>ea}<Esc>
" Fast saving
nmap <leader>w :w!<cr>

" 用来打开list功能，显示不可见字符
nmap <leader>l :set list!<CR>
" 设置为>-格式,用$结尾
set listchars=tab:>-,eol:$

colorscheme desert

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

" help
