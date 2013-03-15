set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
" => ͨ������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
" ����vim�洢����ʷ�����¼������
set history=700

" ��������Ե��﷨���Դ������ɫ�ʱ�ʾ����������﷨����
" syntax enable
" ����﷨����, syntax clear
" set syntax=off
syntax on

" ��ʾ������ʾ
set number

" ��״̬����������Ϣ
set ruler

" ȡ���ײ�״̬����ʾ��1Ϊ�رգ�2Ϊ����
" 0: never
" 1: only if there are at least two windows
" 2: always
set laststatus=2
set statusline=%.45F\ %m\%=\|%{&fileencoding?&fileencoding:&encoding}\|%{&fileformat}\|%{&filetype}\ %4l,%c\

" �������������ʾ���������ڲ鿴��ǰ�������Ϣ
set showcmd

" ����ħ��ƥ����ƣ�����ͨ��:h magic�鿴����ϸ�İ�����Ϣ
set magic

" ������ʾ����������
set cursorline

" ����������ʱ����ݵ���ת��ƥ���������
set showmatch

" ����ƥ������Ž��и�����ʾ
let loaded_matchparen = 1

" ������ʾ����ƥ�䵽���ַ���
set hlsearch
" ������ģʽ�£�����ƥ��
set incsearch
" ����ʱ���Դ�Сд
set ignorecase
" ����ʱ��������д�ַ������������ignorecase������
set smartcase

" �ı���ʾʱ��һ��tab��Ӧ4���ո�
set tabstop=4
" Number of spaces to use for each step of (auto)indent.  Used for
" 'cindent', >>, <<, etc.
" �Զ�����ʱ��ÿ�������߶�
set shiftwidth=4
" smarttab on����������tabʱ������Ŀո�����shiftwidthΪ׼
" smarttab off����������tabʱ������Ŀո�����tabstop��softtabstop��Ϊ׼
set smarttab
" �ڰ��˸��ʱ�����ǰ������4���ո����һ�������
set softtabstop=4
" �����ϰ�tab����ʵ������tabstop���ո�
set expandtab

" ��ִ�к�����ʱ��������ʵʱ�ػ棻
" �ں�����ִ����ɺ�һ�����ػ棬�Ա�������ܡ�
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

" ������list���ܣ���ʾ���ɼ��ַ�
nmap <leader>l :set list!<CR>
" ����Ϊ>-��ʽ,��$��β
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
