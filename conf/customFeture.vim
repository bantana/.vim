" t2t ��׺��֧��
au BufNewFile,BufRead *.t2t set filetype=txt2tags

" JSON ��׺��֧��
au BufRead,BufNewFile *.json set filetype=json 

" mustache ģ�����Զ� HTML �ļ���֧��
au BufNewFile,BufRead *.mhtml set filetype=mustache

" ��php��׺���ļ�ʵ��ͨ���ֵ䲹ȫ
au FileType php call AddPHPFuncList()
function! AddPHPFuncList()
    set dictionary-=$VIM/vimfiles/ExtraVim/php_funclist.txt dictionary+=$VIM/vimfiles/ExtraVim/php_funclist.txt
    set complete-=k complete+=k
endfunction
