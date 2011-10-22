"------------�Զ����ݼ�---------------
"tabpage mappings commented {{{
"map <M-1> 1gt
"map <M-2> 2gt
"map <M-3> 3gt
"map <M-4> 4gt
"map <M-5> 5gt
"map <M-6> 6gt
"map <M-7> 7gt
"map <M-8> 8gt
"map <M-9> 9gt
"map <M-n> :tabnew<CR>
"map <M-c> :tabclose<CR>
" }}}

" �����ݼ� ,/ �����ҹ�����ڵ��ʣ��ɱ༭���������ҳ��������н����ʾ��
" quickfix �У�˫��һ�о��ܶ�λ���ļ��е���Ӧ����
" via http://pseudo.hoop.blog.163.com/blog/static/132509117201151811727993/
nmap <Leader>/ :exec 'lvimgrep /' . input('/', expand('<cword>')) . '/j % <bar> lopen'<CR>

" <F3>�ı��۵�ģʽ {{{
map <F3> :call ToggleFoldMethod()<CR>
func! ToggleFoldMethod()
	if g:foldIsMarker==1
		set foldmethod=indent
		let g:foldIsMarker=0
		echo 'Indent foldmethod'
	else
		set foldmethod=marker
		let g:foldIsMarker=1
		echo 'Marker foldmethod'
	endif
endfunc
"}}}
" <F4>���а�Ȩ���� authorinfo {{{
nmap <F4> :AuthorInfoDetect<CR> "}}}
" <F5> PEP8 �﷨���
" <F6>��Mru {{{
map <silent> <F6> :Mru<CR> "}}}
" <F7>��� PHP �����﷨ "{{{
function! CheckSyntax() 
 if &filetype!="php"
  echohl WarningMsg | echo "Fail to check syntax! Please select the right file!" | echohl None
  return
 endif
 if &filetype=="php"
  " Check php syntax
  setlocal makeprg=\"php\"\ -l\ -n\ -d\ html_errors=off
  " Set shellpipe
  setlocal shellpipe=>
  " Use error format for parsing PHP error output
  setlocal errorformat=%m\ in\ %f\ on\ line\ %l
 endif
 execute "silent make %"
 set makeprg=make
 execute "normal :"
 execute "copen"
endfunction
map <F5> :call CheckSyntax()<CR>
"}}}
" <F8>��Taglist����Tagbar {{{
nmap <silent> <F8> :TagbarToggle<CR> "}}}
" <F9>�ж�/��NERDtree "{{{
map <silent> <F9> :NERDTree<CR> "}}}
" <F10> ���� File �˵�
" <F11> �ںܶ� DWM ������Ϊ���ȫ���Ŀ�ݼ���
" <F12> ����/���� ������ "{{{
map <silent> <F12> :call CallManu()<CR>
function! CallManu()
	if &guioptions =~# 'm'
		set go=
	else
		set go=m
	endif
endfunction
"}}}

" ,nf create new func; ,pf paste func for Python {{{
map <leader>nf :call Py_NewFunc()<CR>
map <leader>pf :call Py_PasteFunc()<CR>
func! Py_NewFunc() range "{{{
    try
        >
        execute a:firstline.",".a:lastline." delete z"
        let visText = @z
        let funcName = input("Function name:")
        let s:py_newFuncText = "def ".funcName."():\n".visText
    catch
        redraw
        echo "Sorry, Some Error Happend"
    endtry
endfunc
"}}}
func! Py_PasteFunc() "{{{
    if exists('s:py_newFuncText')
        let @z = s:py_newFuncText
        normal "zP
        normal f)
        unlet s:py_newFuncText
    else
        echo "Need Create Function First."
    endif
endfunc
"}}}
"}}}
" �ڿ���ģʽ�£�<TAB> ���� >��<S-TAB> ���� <
vmap <silent> <TAB> >
vmap <silent> <S-TAB> <
im jj <ESC>
" edit from http://www.vim.org/scripts/script.php?script_id=3341
no!<M-k> <Up>
no!<M-j> <Down>
no!<M-h> <Left>
no!<M-l> <Right>
au BufRead,BufNewFile *.html setf html
au FileType python,ruby,sh,cpp,c,cc,h,html :call Cc()
au FileType c,cc,cpp,h,html,python,javascript :call AutoSpace()
func! AutoSpace() "{{{
    ino , ,<SPACE>
    ino : :<SPACE>
    "ino { <SPACE>{
    "ino ( <SPACE>(
    "ino ; ;<SPACE>
    ino =<SPACE> <SPACE>=<SPACE>
    ino <<SPACE> <SPACE><<SPACE>
    ino ><SPACE> <SPACE>><SPACE>
    ino +<SPACE> <SPACE>+<SPACE>
    ino -<SPACE> <SPACE>-<SPACE>
    ino *<SPACE> <SPACE>*<SPACE>
    ino /<SPACE> <SPACE>/<SPACE>
    ino !=<SPACE> <SPACE>!=<SPACE>
    ino <=<SPACE> <SPACE><=<SPACE>
    ino *=<SPACE> <SPACE>*=<SPACE>
    ino /=<SPACE> <SPACE>/=<SPACE>
    ino >><SPACE> <SPACE>>><SPACE>
    ino <<<SPACE> <SPACE><<<SPACE>
    ino >=<SPACE> <SPACE>>=<SPACE>
    ino ==<SPACE> <SPACE>==<SPACE>
    ino +=<SPACE> <SPACE>+=<SPACE>
    ino -=<SPACE> <SPACE>-=<SPACE>
    ino &&<SPACE> <SPACE>&&<SPACE>
endf "}}}
func! Cc() "{{{
	if exists("$DISPLAY")
        nm mm :call DebugInGui()<CR>
        im mm <ESC> :call DebugInGui()<CR>
	el
		im mm <ESC> :call DebugInTerminal()<CR>
		nm mm :call DebugInTerminal()<CR>
	en
endf "}}}
func! DebugInGui() "{{{
	exe "w"
	if &filetype == 'c'
		exe "!gcc -Wall % -o %<"
		exe "!clear;./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'cpp'
		exe "!g++ -Wall % -o %<"
		exe "!clear;./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'python'
		exe "!clear;python %"
	elsei &filetype == 'ruby'
		exe "!clear;ruby  %"
	elsei &filetype == 'sh'
		exe "!clear;bash %"
	elsei &filetype == 'perl'
		exe "!clear;perl %"
	en
endf "}}}
func! DebugInTerminal() "{{{
	exe "w"
	if &filetype == 'c'
		exe "!gcc -Wall % -o %<"
		exe "!./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'cpp'
		exe "!g++ -Wall % -o %<"
		exe "!./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'python'
		exe "!python %"
	elsei &filetype == 'ruby'
		exe "!ruby  %"
	elsei &filetype == 'sh'
		exe "!bash %"
	elsei &filetype == 'perl'
		exe "!perl %"
	elsei &filetype =='html'
		exe "!firefox %"
	en
endf "}}}
