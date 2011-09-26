"------------�Զ����ݼ�---------------
"tabpage mappings {{{
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
map <M-n> :tabnew<CR>
map <M-c> :tabclose<CR>
" }}}

" �����ˡ�<leader>e����ݼ��������롰,e��ʱ�����_vimrc���б༭
"map <silent> <leader>e :call EditVimrc()<CR>
map <silent> <leader>e :e $V<CR>

" ,t Temp����
map	<silent> <leader>t :e $VIMFILES/TEMP.txt<CR>

" ,g Todo����
map <silent> <leader>g :e $VIMFILES/own.todo<CR>

" NewFunc script for Python {{{
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

" �����ݼ� ,/ �����ҹ�����ڵ��ʣ��ɱ༭���������ҳ��������н����ʾ��
" quickfix �У�˫��һ�о��ܶ�λ���ļ��е���Ӧ����
" ver http://pseudo.hoop.blog.163.com/blog/static/132509117201151811727993/
nmap <Leader>/ :exec 'lvimgrep /' . input('/', expand('<cword>')) . '/j % <bar> lopen'<CR>

" <F3>�ı��۵�ģʽ 
"{{{
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

" <F4>���а�Ȩ���� authorinfo
nmap <F4> :AuthorInfoDetect<CR> 

" <F5>�����ļ�����
"{{{
map <F5> :call Do_OneFileMake()<CR>
function! Do_OneFileMake()
  if expand("%:p:h")!=getcwd()
    echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
    return
  endif
  let sourcefileename=expand("%:t")
  if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
    echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
    return
  endif
  let deletedspacefilename=substitute(sourcefileename,' ','','g')
  if strlen(deletedspacefilename)!=strlen(sourcefileename)
    echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
    return
  endif
  if &filetype=="c"
    if g:iswindows==1
      set makeprg=gcc\ -o\ %<.exe\ %
    else
      set makeprg=gcc\ -o\ %<\ %
    endif
  elseif &filetype=="cpp"
    if g:iswindows==1
      set makeprg=g++\ -o\ %<.exe\ %
    else
      set makeprg=g++\ -o\ %<\ %
    endif
    "elseif &filetype=="cs"
    "set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
  endif
  if(g:iswindows==1)
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','.exe','g')
    let toexename=outfilename
  else
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','','g')
    let toexename=outfilename
  endif

  if filereadable(outfilename)
    if(g:iswindows==1)
      let outdeletedsuccess=delete(getcwd()."\\".outfilename)
    else
      let outdeletedsuccess=delete("./".outfilename)
    endif
    if(outdeletedsuccess!=0)
      set makeprg=make
      echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
      return
    endif
  endif

  execute "silent make"
  set makeprg=make
  execute "normal :"

  if filereadable(outfilename)
    if(g:iswindows==1)
      execute "!".toexename
    else
      execute "!./".toexename
    endif
  endif

  execute "copen"

endfunction

"����make������
map <F6> :call Do_make()<CR>
map <c-F6> :silent make clean<CR>
function! Do_make()
  set makeprg=make
  execute "silent make"
  execute "copen"
endfunction
"}}}

" <F6>��Mru
map <silent> <F6> :Mru<CR>

" <F7>��� PHP �����﷨ 
"{{{
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

" <F8>��Taglist����Tagbar
nmap <silent> <F8> :TagbarToggle<CR>

" <F9>�ж�/��NERDtree
map <silent> <F9> :NERDTree<CR>

" <F11> �ںܶ� DWM ������Ϊ���ȫ���Ŀ�ݼ���

" <F12> ����/���� ������
"{{{
map <silent> <F12> :call CallManu()<CR>
function! CallManu()
	if &guioptions =~# 'm'
		set go=
	else
		set go=m
	endif
endfunction
"}}}

