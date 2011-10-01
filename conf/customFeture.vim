au BufNewFile,BufRead *.t2t set filetype=txt2tags " t2t ��׺��֧��
au BufRead,BufNewFile *.json set filetype=json " JSON ��׺��֧��
au BufNewFile,BufRead *.mhtml set filetype=mustache " mustache ģ�����Զ� HTML �ļ���֧��
au BufNewFile,BufRead *.todo set syntax=Todo " todo ��׺��֧��

" ���� fcitx ���뿪����ģʽʱ�ı�����ģʽ ��ע�� {{{
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
"}}}

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

" ��php��׺���ļ�ʵ��ͨ���ֵ䲹ȫ ��ע�� {{{
"au FileType php call AddPHPFuncList()
"function! AddPHPFuncList()
    "set dictionary-=$VIM/vimfiles/ExtraVim/php_funclist.txt dictionary+=$VIM/vimfiles/ExtraVim/php_funclist.txt
    "set complete-=k complete+=k
"endfunction
"}}}
