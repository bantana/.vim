" t2t ��׺��֧��
au BufNewFile,BufRead *.t2t set filetype=txt2tags

" JSON ��׺��֧��
au BufRead,BufNewFile *.json set filetype=json 

" mustache ģ�����Զ� HTML �ļ���֧��
au BufNewFile,BufRead *.mhtml set filetype=mustache

" todo ��׺��֧��
au BufNewFile,BufRead *.todo set syntax=Todo

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

" ��php��׺���ļ�ʵ��ͨ���ֵ䲹ȫ
au FileType php call AddPHPFuncList()
function! AddPHPFuncList()
    set dictionary-=$VIM/vimfiles/ExtraVim/php_funclist.txt dictionary+=$VIM/vimfiles/ExtraVim/php_funclist.txt
    set complete-=k complete+=k
endfunction
