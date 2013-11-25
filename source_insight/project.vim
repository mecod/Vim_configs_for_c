" Author PJG <pjg864@163.com>

if !exists("g:project_script")
let g:project_script = 1
else
finish
endif


"--------------------------------------------------------------------
" SOME USEFUL MAPPED KEYS, YOU CAN CHANGE IT!
"--------------------------------------------------------------------
"map some useful keys
noremap <space> <C-]>

"Cscope Setting
if has("cscope")
set csprg=cscope
set csto=0
set cst
set nocsverb
set cscopequickfix=s-,c-,d-,i-,t-,e-
set csverb
endif

"	 0 or s: Find this C symbol
"	 1 or g: Find this definition
"	 2 or d: Find functions called by this function
"	 3 or c: Find functions calling this function
"	 4 or t: Find this text string
"	 6 or e: Find this egrep pattern
"	 7 or f: Find this file
"	 8 or i: Find files #including this file
"
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

noremap <F1> <C-O>
noremap <F2> <C-I>
noremap <F3> :cp<CR>
noremap <F4> :cn<CR>
noremap <C-F5> :call Toggle_QFW()<cr>
noremap <C-F3> :vimgrep /<c-r><c-w>/gj ./**/*.[ch]<cr>

function! Toggle_QFW()
if exists("g:qfw_opened") && g:qfw_opened == 1
cclose
unlet g:qfw_opened
else
copen
let g:qfw_opened = 1
endif
endfunction


set cursorline
set autochdir


"--------------------------------------------------------------------
" START PROJECT FUNCTIONS AND VARIABLES
"--------------------------------------------------------------------
"INCLUDES DIR
let g:include_dirs = ""
"Make sure this file loaded on the project base directory
let g:base_dir = getcwd()
"/ is common used
let g:cscope_file = g:base_dir . "/cscope.out"

let s:g_files_list = g:base_dir . "/files.list"

execute "set path=.," . g:base_dir . "," . g:include_dirs


"func! Search_in_files(files_list, pattern)
"	 let filename = a:files_list
"	 if filereadable(filename)
"	 let list=readfile(filename)
"	 let lines=join(list, ' ')
"	 silent execute 'grep ' . a:pattern . ' ' . lines
"	 endif
"endfunc

"call Search_in_files('file.list', 'BLOWFISH')



func! CSCOPE_FILES(project_base_dir, files_list)
if a:project_base_dir != '' && isdirectory(a:project_base_dir) && filereadable(a:files_list)
if filereadable(g:cscope_file)
call delete(g:cscope_file)
endif
let pwd = getcwd()
execute "cd " . a:project_base_dir
silent execute "!cscope -b -i " . a:files_list
execute "cs reset"
execute "cs add " . g:cscope_file . " " . g:base_dir
endif
execute "cd " . pwd
endfunc

"call CSCOPE_FILES('.', 'files.list')

func! Get_project_files(project_base_dir)
if a:project_base_dir != ''
let filelist = expand(a:project_base_dir . '/**/*.[ch]')
let file_list = split(filelist, "\n")
" TODO try to confirm the file's permission
return file_list
endif
endfunc

"call Get_project_files('.')

fun! Update_project(project_base_dir)
if a:project_base_dir != '' && isdirectory(a:project_base_dir)
let pwd = getcwd()
let files = s:g_files_list
execute "cd " . a:project_base_dir
let filelist = Get_project_files('.')
"setlocal noautochdir
if writefile(filelist, files) == 0
call CSCOPE_FILES('.', files)
echo "Update project successfully!"
else
echo "Failed to update project!"
endif
endif
execute "cd " . pwd
endfunc


func! Search_in_project()
if filereadable(s:g_files_list)
let file_list = readfile(s:g_files_list)
let filename = inputdialog("Searching for file:")
if filename != ""
let searched = ['Select your wanted file:']
let searched2 = ['null']
let i = 0
for line in file_list
let str=matchstr(line, filename)
if str != ''
let i += 1
call add(searched, i . '. ' . line)
call add(searched2, line)
endif
endfor
if i > 1
let n = inputlist(searched)
else
let n = i
endif
if n != 0
let searched_file = substitute(searched2[n], "^\.", "", "")
execute 'vsp ' . g:base_dir . searched_file
else
echo "No result!"
endif
else
echo "Empty file name!"
endif
else
call Update_project(g:base_dir)
echo "Try again!"
endif
endfunc


func! Search_func_in_project()
"Can use <C-_> + c, d, etc
if filereadable(g:cscope_file)
let funcname = inputdialog("What function do you want to get?")
if funcname != ""
"find definition
execute "cs find g " . funcname
else
echo "Empty function name!"
endif
else
call Update_project(g:base_dir)
echo "Try again!"
endif
endfunc

"if !filereadable("cscope.out")
"	call Update_project('Z:\test\DDNS\Oray')
"endif

"Add cscope.out file
if filereadable(g:cscope_file)
execute "cs add " . g:cscope_file . " " . g:base_dir
else
call Update_project(g:base_dir)
endif

"打开目录
execute "NERDTree " . g:base_dir
"execute "normal <C-W>k"

noremap <C-F10> :call Update_project(g:base_dir)<cr>
noremap <S-F10> :call Search_in_project()<cr>
noremap <M-F10> :call Search_func_in_project()<cr>
noremap <F5>	:NERDTree <C-R>=g:base_dir<CR><CR>