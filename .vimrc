set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin
:filetype plugin on
:filetype indent on
set nobackup
set ai
syntax on
set si
set nowritebackup
set tabstop=4
set softtabstop=4
set shiftwidth=4
set langmenu=en
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
let &termencoding=&encoding
set fileencodings=utf-8,gbk,cp936,cp950,latin1
set encoding=utf-8
let g:fencview_autodetect = 1
let g:fencview_checklines = 100
set ff=unix
set guioptions-=T
"punk
"set cscopequickfix=s-,c-,d-,i-,t-,e-
"set cscopequickfix=s0,c0,d0,i0,t0,e0
set hlsearch
"set t_Co=256
map <C-n> :nohl<cr>
let mapleader=","
let g:mapleader = ","
let NERDTreeShowHidden=1
"set tags=./tags
set tags=tags
syntax on
set nu
set ignorecase
set mouse=a
map <right> :bn<cr>
map <left> :bp<cr>
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost vimrc source ~/.vimrc<cr>
" Fast saving
nmap <leader>w :w!<cr>
set autoread
map <leader>bb :cd ..<cr>
"Switch to current dir
map <leader>cd :cd %:p:h<cr>
map <leader>ce :cd %:p:h<cr>:read !pwd<cr>:cd -<cr><esc>"+yy<esc>u
map <leader>cp :let @+=  "/".bufname("%")<cr>
map <leader>cf :let @+= bufname("%")<cr>
map <leader>cv :let @+=getcwd()<cr>
nmap <leader>yy "+yy
nmap <leader>yw "+yw
nmap <leader>pp "+p
nmap <leader>0 "0p
"colorscheme darkblue
"colorscheme morning
"colorscheme bluegreen 
"colorscheme molokai
"colorscheme zellner
"set background=dark
"set background=dark
"colorscheme peaksea
"colorscheme desert
"colorscheme default
nmap <F9> <C-W>w                  命令模式下转移光标到不同窗口
imap <F9> <ESC><F9>               输入模式下运行<F9>
noremap <leader>vv <C-V>
nmap <leader>sp :mkses! ./prj.vim<cr>
nmap <leader>lp :source ./prj.vim<cr>
nmap <leader>lv :source ~/.vimrc<cr>
"nmap <leader>csq :set cscopequickfix=s+,c+<cr>
"nmap <leader>csc :set cscopequickfix=s-,c-<cr>
nmap <leader>sq :set cscopequickfix=s-,c-,d-,i-,t-,e-<cr>
nmap <leader>sc :set cscopequickfix=s0,c0,d0,i0,t0,e0<cr>
nmap <leader>wi 20<C-W>+ 
nmap <leader>wd 20<C-W>- 
:cd ./
let g:curdir = getcwd()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i



""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 3               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")                "设置tag文件的名字
let g:LookupFile_TagExpr = '"./filenametags"'
endif
"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>




"快捷键映射
"nmap <F3> <c-y>,<RETURN>
nnoremap <silent> <F3> :Grep -R <CR>
nmap <F4> ,ci
map <F6> :TlistToggle<RETURN>
imap <F6> :TlistToggle<RETURN>
map <F7> :NERDTreeToggle<RETURN>
imap <F7> :NERDTreeToggle<RETURN>
nmap <F8> :FencAutoDetect<RETURN>

set diffexpr=MyDiff()
function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '\"' . arg1 . '\"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '\"' . arg2 . '\"' | endif
	let arg3 = v:fname_outlet NERDTreeShowHidden=1
	if arg3 =~ ' ' | let arg3 = '\"' . arg3 . '\"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '\"' . $VIMRUNTIME . '\diff\"'
			let eq = '\"\"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '\" ', '') . '\diff\"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction



function Test2()
	let buf_name= bufname("%")
	let punk_tmp =strpart(buf_name,0,1) 
	echo punk_tmp
	if(punk_tmp=="/")
		echo "yes"
		let punk_path = buf_name
	else
		echo "no"
		let punk_path = getcwd()."/".buf_name
	endif
	echo punk_path
	return punk_path
endfunction
