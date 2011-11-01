" ----------- base setting ----------- [[[
let mapleader = ','                    " Set mapleader
set linebreak                          " ���ڵ����м����
set formatoptions+=mB                  " �򿪶���ģ�����������֧��
set autochdir                          " �Զ����뵱ǰ�༭�ļ���Ŀ¼
set guioptions=                        " ������
"set ignorecase                        " ���Դ�Сдƥ��
set scrolloff=10                       " ���ù��������±߽�ľ���
set showcmd                            " �ڴ������½���ʾ�������������벿��
set cursorline                         " �������������
set nocompatible                       " ��Ҫvimģ��viģʽ
set number                             " ��ʾ�к�
set guifont=YaHei\ Consolas\ Hybrid\ 9 " �����ź�����
set visualbell                         " ��Ҫ beep Ҳ��Ҫ����
set foldmarker=[[[,]]]                 " �� [[[ ]]] ��� {{{ }}}
if &term =~ "screen"
    set t_Co=256
endif
if &term ==? "linux"                   " ��������
    colorscheme slate
else
    colorscheme lucius "lilypink
endif

" edit from http://www.vim.org/scripts/script.php?script_id=3341
set backspace=2                        " �����ڲ��뿪ʼ��λ�����˸�CTRL-W �� CTRL-U ������뿪ʼ��λ��ʱͣ��һ��
set autoindent                         " �Զ�����
set smartindent                        " ��������
"set incsearch                          " ����ʱ��ʾĿǰ����ģʽ��ƥ��λ��
"set cindent                            " �Զ� C ��������
set showmode                           " ��ʾ��ǰģʽ
set wildmenu                           " ��ǿģʽ�����в�ȫ
set magic                              " �ı�����ģʽʹ�õ������ַ����򿪾ͺã�ֻ���� Vi �����Ҫ�ص�
"set exrc                              " ������뵱ǰĿ¼�� .vimrc .exrc .gvimrc

" ��һ��tab����4���ո�
set expandtab
set tabstop=4     " <TAB> ����Ŀո���
set shiftwidth=4  " ���Զ�������ʹ�õĿհ���Ŀ
set softtabstop=4 " �༭ʱ�� <TAB> �����Ŀո���Ŀ

" �����﷨
syntax on
behave mswin
filetype plugin on

" ���ض������Ϊ�۵�����
let g:foldIsMarker=1
set foldmethod=marker

" encoding
set encoding=utf-8
set termencoding=utf-8

" ȡ���Զ����ݹ���
set nobackup
set nowritebackup

" ����ʱĬ�ϴ�С [[[
" ����ʲô����������������ߴ�
set lines=44 columns=84

" GUI ������ʽ�ߴ�
"au GUIEnter * set lines=140 columns=82

" ��������ʽ�趨�ߴ�
if has("gui_running")
  " GUI is running or is about to start.
  " set gvim window size
  " set lines=140 columns=82
else
  " This is console Vim.
  if exists("+lines")
"    set lines=140
  endif
  if exists("+columns")
"    set columns=82
  endif
endif

" ��������� 7.3 �в���ʹ��
" Maximize gvim on startup. Note we Dutch must use ~m, English/American people use ~x
"au GUIEnter * simalt ~x
"au GUIEnter * simalt ~m
"au GUIEnter * simalt ~v
" ]]]

" �ж���ǰ����ϵͳ���� [[[
if(has("win32") || has("win95") || has("win64") || has("win16")) 
    "set fileencoding=chinese
    let g:iswindows=1
	language messages zh_CN.utf-8
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
	" ����˵�����
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
else
    set fileencoding=utf-8
    let g:iswindows=0
endif
set langmenu=zh_CN.utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" ]]]
" ]]]
" ----------- Custom Feture ---------- [[[
au BufNewFile,BufRead *.todo set syntax=Todo        " todo ��׺��֧��
au BufRead,BufNewFile *.json set filetype=json      " JSON ��׺��֧��
au BufNewFile,BufRead *.t2t set filetype=txt2tags   " t2t ��׺��֧��
au BufNewFile,BufRead *.mhtml set filetype=mustache " mustache ģ�����Զ� HTML �ļ���֧��

func! s:exeCmd(echoColor, tI1, tI2) "[[[
    let color_normal = 'White'
    let color_insert = 'RoaylBlue1'
    let color_exit = 'Green'

    let echoStr = "echo -ne '" . a:echoColor . "]12;'"
    let tI1Str = a:tI1 . ']12;'
    let tI2Str = a:tI2

    exe 'silent !' . echoStr . shellescape(color_normal, 1) . tI2Str
    let &t_SI = tI1Str . color_insert . tI2Str
    let &t_EI = tI1Str . color_normal . tI2Str
    exe 'autocmd VimLeave * :!' . echoStr . shellescape(color_exit, 1) . tI2Str
endfunc
func! CurserColorInTmux()
    if &term =~ 'xterm\|rxvt'
        call <SID>exeCmd('\e', '\e', '\007')
    elseif &term =~ "screen"
        if exists('$TMUX')
            call <SID>exeCmd('\033Ptmux;\033\e', '\033Ptmux', '\007\033\\')
        elseif !exists('$SUDO_UID')
            call <SID>exeCmd('\033P\e', '\033P', '\007\033\\')
        endif
    endif
endfunc
"func! CurserColorInTmux() "[[[
    "let color_normal = 'White'
    "let color_insert = 'RoaylBlue1'
    "let color_exit = 'Green'
    "if &term =~ 'xterm\|rxvt'
        "execute "silent !echo -ne '\e]12;'" . shellescape(color_normal, 1) . "\007"
        "let &t_SI = '\e]12;' . color_insert . '\007'
        "let &t_EI = '\e]12;' . color_normal . '\007'
        "execute "autocmd VimLeave * :!echo -ne '\e]12;'" . shellescape(color_exit, 1) . "\007"
    "elseif &term =~ "screen"
        "if exists('$TMUX')
            "execute "silent !echo -ne '\033Ptmux;\033\e]12;'" . shellescape(color_normal, 1) . "\007\033\\"
            "let &t_SI = '\033Ptmux]12;' . color_insert . '\007\033\\'
            "let &t_EI = '\033Ptmux]12;' . color_normal . '\007\033\\'
            "execute "autocmd VimLeave * :!echo -ne '\033Ptmux;\033\e]12;'" . shellescape(color_exit, 1) . "\007\033\\"
        "elseif !exists('$SUDO_UID')
            ""call <SID>exeCmd('\033P\e', '\033P', '\007\033\\')
            "execute "silent !echo -ne '\033\e]12;'" . shellescape(color_normal, 1) . "\007\033\\"
            "let &t_SI = '\033P]12;' . color_insert . '\007\033\\'
            "let &t_EI = '\033P]12;' . color_normal . '\007\033\\'
            "execute "autocmd VimLeave * :!echo -ne '\033\e]12;'" . shellescape(color_exit, 1) . "\007\033\\"
        "endif
    "endif
"endfunc "]]]
"call CurserColorInTmux() "]]]

" ���� fcitx ���뿪����ģʽʱ�ı�����ģʽ ��ע�� [[[
"let g:input_toggle = 1
"function! Fcitx2en()
   "let s:input_status = system("fcitx-remote")
   "if s:input_status == 2
      "let g:input_toggle = 1
      "let l:a = system("fcitx-remote -c")
   "endif
"endfunction
"function! Fcitx2zh()
   "let s:input_status = system("fcitx-remote")
   "if s:input_status != 2 && g:input_toggle == 1
      "let l:a = system("fcitx-remote -o")
      "let g:input_toggle = 0
   "endif
"endfunction
"set timeoutlen=150
"autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()
" ]]]

" markdown syntax settings
"augroup mkd
    "autocmd BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set ai formatoptions=tcroqn2 comments=n:>
    "autocmd BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set wrap nonumber
"augroup END

" gjsLint
" �ļ��� ~/.vim/ftplugin/javascript/
" �� jsLint http://www.vim.org/scripts/script.php?script_id=2729 �޸Ķ���
" �޸��ļ��� https://github.com/ktmud/vim-unix/raw/master/.vim/ftplugin/javascript/
" �������£�http://wiki.ktmud.com/tips/Vim.html

" ��php��׺���ļ�ʵ��ͨ���ֵ䲹ȫ ��ע�� [[[
"au FileType php call AddPHPFuncList()
"function! AddPHPFuncList()
    "set dictionary-=$VIM/vimfiles/ExtraVim/php_funclist.txt dictionary+=$VIM/vimfiles/ExtraVim/php_funclist.txt
    "set complete-=k complete+=k
"endfunction
" ]]]
" ]]]
"----------- Custom Shortcut -------- [[[
" tabpage mappings commented [[[
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
" ]]]

" �����ݼ� ,/ �����ҹ�����ڵ��ʣ��ɱ༭���������ҳ��������н����ʾ��
" quickfix �У�˫��һ�о��ܶ�λ���ļ��е���Ӧ����
" via http://pseudo.hoop.blog.163.com/blog/static/132509117201151811727993/
nmap <Leader>/ :exec 'lvimgrep /' . input('/', expand('<cword>')) . '/j % <bar> lopen'<CR>

" %s ȫ���滻��ǰ������ڵĵ��� [[[
nmap %s :exec '%s/'.expand('<cword>').'/'.input(':%s/'.expand('<cword>').'/?/g  ', expand('<cword>')) <CR>
" ]]]

" <F3>�ı��۵�ģʽ [[[
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
" ]]]
" <F4>���а�Ȩ���� authorinfo [[[
nmap <F4> :AuthorInfoDetect<CR>
" ]]]
" <F5> PEP8 �﷨���
" <F6>�� Mru [[[
map <silent> <F6> :Mru<CR>
" ]]]
" <F7>��� PHP �����﷨ [[[
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
" ]]]
" <F8>�� Taglist ���� Tagbar [[[
nmap <silent> <F8> :TagbarToggle<CR>
" ]]]
" <F9>�ж�/�� NERDtree [[[
map <silent> <F9> :NERDTree<CR>
" ]]]
" <F10> ���� File �˵�
" <F11> �ںܶ� DWM ������Ϊ���ȫ���Ŀ�ݼ���
" <F12> ����/���� ������ [[[
map <silent> <F12> :call CallManu()<CR>
function! CallManu()
	if &guioptions =~# 'm'
		set go=
	else
		set go=m
	endif
endfunction
" ]]]

" ,nf create new func; ,pf paste func for Python [[[
map <leader>nf :call Py_NewFunc()<CR>
map <leader>pf :call Py_PasteFunc()<CR>
func! Py_NewFunc() range "[[[
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
"]]]
func! Py_PasteFunc() "[[[
    if exists('s:py_newFuncText')
        let @z = s:py_newFuncText
        normal "zP
        normal f)
        unlet s:py_newFuncText
    else
        echo "Need Create Function First."
    endif
endfunc
"]]]
" ]]]
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
func! AutoSpace() "[[[
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
endf
"]]]
func! Cc() "[[[
	if exists("$DISPLAY")
        nm mm :call DebugInGui()<CR>
        im mm <ESC> :call DebugInGui()<CR>
	el
		im mm <ESC> :call DebugInTerminal()<CR>
		nm mm :call DebugInTerminal()<CR>
	en
endf
"]]]
func! DebugInGui() "[[[
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
endf
"]]]
func! DebugInTerminal() "[[[
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
endf
"]]]
"]]]
"----------- Normal Plugins Configure [[[
" Taglist ���� [[[
"TlistUpdate���Ը���tags
"map <F3> :silent! Tlist<CR> "����F3�Ϳ��Ժ�����
let Tlist_Ctags_Cmd='ctags' "��Ϊ���Ƿ��ڻ�����������Կ���ֱ��ִ��
let Tlist_Use_Right_Window=0 "�ô�����ʾ���ұߣ�0�Ļ�������ʾ�����
"let Tlist_Show_One_File=0 "��taglist����ͬʱչʾ����ļ��ĺ����б������ֻ��1��������Ϊ1
let Tlist_File_Fold_Auto_Close=1 "�ǵ�ǰ�ļ��������б��۵�����
let Tlist_Exit_OnlyWindow=1 "��taglist�����һ���ָ��ʱ���Զ��Ƴ�vim
"�Ƿ�һֱ����tags.1:����;0:������
let Tlist_Process_File_Always=0 "����һֱʵʱ����tags����Ϊû�б�Ҫ
"let Tlist_Inc_Winwidth=30
" ��������趨���������,����taglist��ctags·��������Ҳ���԰�ctags·����
" �ӽ�ϵͳ���� path ��Ͳ���������
"let Tlist_Ctags_Cmd = '~/ctags.exe'
" ����tags�ļ���Ѱ��·��
"set tags += tags;
" ]]]
" AuthorInfo ���� [[[
let g:vimrc_author='yicuan' 
let g:vimrc_email='bolasblack@gmail.com' 
let g:vimrc_homepage='http://plafer.tk' 
" ]]]
" Tagbar ���� [[[
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
" ]]]
" Doxygen ���� [[[
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:Doxygen_enhanced_color = 1
let g:DoxygenToolkit_authorName = "yicuan bolasblack[at]gmail.com"
let g:DoxygenToolkit_licenseTag = "Do any thing you like"
let g:DoxygenToolkit_blockHeader = "======================================="
let g:DoxygenToolkit_briefTag_pre = "@Description:"
let g:DoxygenToolkit_paramTag_pre = "@Param:"
let g:DoxygenToolkit_returnTag_pre = "@Return:"
let g:DoxygenToolkit_blockFooter = "======================================="
" ]]]
" TxtBrowser ���� [[[
au BufEnter *.txt setlocal ft=txt
" let g:default_web_browser=chrome
" ]]]
" Zen Coding ���� [[[
let g:user_zen_settings = { 
  \  'indentation' : '  ', 
  \  'perl' : { 
  \    'aliases' : { 
  \      'req' : 'require ' 
  \    }, 
  \    'snippets' : { 
  \      'use' : "use strict\nuse warnings\n\n", 
  \      'warn' : "warn \"|\";", 
  \    } 
  \  } 
  \} 
  let g:user_zen_expandabbr_key = '<c-y>'    "����Ϊctrl+yչ��
  let g:use_zen_complete_tag = 1
" ]]]
" NeoComplcache ���� [[[
" Use neocomplcache. 
let g:neocomplcache_enable_at_startup = 1
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 0 
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 0 
" Use underbar completion. 
let g:neocomplcache_enable_underbar_completion = 0 
" Set minimum syntax keyword length. 
let g:neocomplcache_min_syntax_length = 3 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' 

"Define dictionary. 
let g:neocomplcache_dictionary_filetype_lists = { 
	\ 'default' : '', 
	\ 'vimshell' : $HOME.'/.vimshell_hist', 
	\ 'scheme' : $HOME.'/.gosh_completions' 
	\ } 

" Define keyword. 
if !exists('g:neocomplcache_keyword_patterns') 
	let g:neocomplcache_keyword_patterns = {} 
endif 
let g:neocomplcache_keyword_patterns['default'] = '\h\w*' 

" Plugin key-mappings. 
imap <C-k>     <Plug>(neocomplcache_snippets_expand) 
smap <C-k>     <Plug>(neocomplcache_snippets_expand) 
inoremap <expr><C-g>     neocomplcache#undo_completion() 
inoremap <expr><C-l>     neocomplcache#complete_common_string() 

" SuperTab like snippets behavior. 
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>" 

" Recommended key-mappings. 
" <CR>: close popup and save indent. 
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" 
" <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
" <C-h>, <BS>: close popup and delete backword char. 
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><C-d>  neocomplcache#close_popup() 
inoremap <expr><C-e>  neocomplcache#cancel_popup() 

" AutoComplPop like behavior. 
"let g:neocomplcache_enable_auto_select = 1 

" Shell like behavior(not recommended). 
"set completeopt+=longest 
"let g:neocomplcache_enable_auto_select = 1 
"let g:neocomplcache_disable_auto_complete = 1 
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>" 
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" 

" Enable omni completion. 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 

" Enable heavy omni completion. 
if !exists('g:neocomplcache_omni_patterns') 
let g:neocomplcache_omni_patterns = {} 
endif 
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete 
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" ]]]
" Netrw ���� [[[
let g:netrw_winsize = 30
"����',fe'ʱ���ͻ��һ����ֱ�ָ��Ĵ��������ǰ�ļ����ڵ�Ŀ¼�����ڵĿ��Ϊ30
"nmap <silent> <leader>ntf :Sexplore!<cr> 
" ]]]
" ConqueTerm ���� [[[
let g:ConqueTerm_Color = 2
" ]]]
" Sparkup ���� [[[
let g:sparkupExecuteMapping = '<C-y>'
" ]]]
" PEP8.vim ���� [[[
let g:pep8_ignore = 'E401,E501' "���������һ��import���ģ�鲻����
" ]]]
"]]]
