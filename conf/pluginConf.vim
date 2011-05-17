"------------ һ�������� ---------------
" Taglist ���� {{{
"TlistUpdate���Ը���tags
"map <F3> :silent! Tlist<CR> "����F3�Ϳ��Ժ�����
"let Tlist_Ctags_Cmd='ctags' "��Ϊ���Ƿ��ڻ�����������Կ���ֱ��ִ��
"let Tlist_Use_Right_Window=0 "�ô�����ʾ���ұߣ�0�Ļ�������ʾ�����
"let Tlist_Show_One_File=0 "��taglist����ͬʱչʾ����ļ��ĺ����б������ֻ��1��������Ϊ1
"let Tlist_File_Fold_Auto_Close=1 "�ǵ�ǰ�ļ��������б��۵�����
"let Tlist_Exit_OnlyWindow=1 "��taglist�����һ���ָ��ʱ���Զ��Ƴ�vim
"�Ƿ�һֱ����tags.1:����;0:������
"let Tlist_Process_File_Always=0 "����һֱʵʱ����tags����Ϊû�б�Ҫ
"let Tlist_Inc_Winwidth=0
" ��������趨���������,����taglist��ctags·��������Ҳ���԰�ctags·����
" �ӽ�ϵͳ���� path ��Ͳ���������
"let Tlist_Ctags_Cmd = '~/ctags.exe'
" ����tags�ļ���Ѱ��·��
"set tags += tags;
" }}}

" Tagbar ����
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

" TxtBrowser ���� {{{
au BufEnter *.txt setlocal ft=txt
" let g:default_web_browser=chrome
" }}}

" Zen Coding ���� {{{
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
" }}}

" Netrw ���� {{{
let g:netrw_winsize = 30
"����',fe'ʱ���ͻ��һ����ֱ�ָ��Ĵ��������ǰ�ļ����ڵ�Ŀ¼�����ڵĿ��Ϊ30
nmap <silent> <leader>ntf :Sexplore!<cr> 
"}}}

" NeoComplcache ���� "{{{
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
"}}}
