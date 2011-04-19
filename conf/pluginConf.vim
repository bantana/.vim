"------------ һ�������� ---------------
" Taglist ���� {{{
"TlistUpdate���Ը���tags
map <F3> :silent! Tlist<CR> "����F3�Ϳ��Ժ�����
"let Tlist_Ctags_Cmd='ctags' "��Ϊ���Ƿ��ڻ�����������Կ���ֱ��ִ��
let Tlist_Use_Right_Window=0 "�ô�����ʾ���ұߣ�0�Ļ�������ʾ�����
let Tlist_Show_One_File=0 "��taglist����ͬʱչʾ����ļ��ĺ����б������ֻ��1��������Ϊ1
let Tlist_File_Fold_Auto_Close=1 "�ǵ�ǰ�ļ��������б��۵�����
let Tlist_Exit_OnlyWindow=1 "��taglist�����һ���ָ��ʱ���Զ��Ƴ�vim
"�Ƿ�һֱ����tags.1:����;0:������
let Tlist_Process_File_Always=0 "����һֱʵʱ����tags����Ϊû�б�Ҫ
let Tlist_Inc_Winwidth=0
" ��������趨���������,����taglist��ctags·��������Ҳ���԰�ctags·����
" �ӽ�ϵͳ���� path ��Ͳ���������
"let Tlist_Ctags_Cmd = '~/ctags.exe'
" ����tags�ļ���Ѱ��·��
"set tags += tags;
" }}}

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

"vimwiki {{{
let g:vimwiki_list = [{'path': '$VIM/vimwiki/', 
			\'path_html': '$VIM/vimwiki/html/',
			\'html_header':'$VIM/vimwiki/kwiki_tpl/header.htm',
			\'html_footer':'$VIM/vimwiki/kwiki_tpl/footer.htm'},
			\{'path':'X:\demo\wiki'}]
" �Ƿ��ڴ����ļ�����ʱ�����html  ������ñ��������Ƚ���
" ������Ĭ��û������  ����Ҫ�Ļ��Ͱ���һ�и��Ƶ�����ȥ
"     \ 'auto_export': 1,
 
" �������û���˵�����ǲ�����ô��Ҫ�շ�Ӣ�ĳ�Ϊά������
let g:vimwiki_camel_case = 0
 
" ���Ϊ��ɵ� checklist ��Ŀ�����ر����ɫ
let g:vimwiki_hl_cb_checked = 1
 
" �ҵ� vim ��û�в˵��ģ���һ�� vimwiki �˵���Ҳû������
" let g:vimwiki_menu = ''
 
" �Ƿ������﷨�۵�  �����ļ��Ƚ���
"let g:vimwiki_folding = 1
 
" �Ƿ��ڼ����ִ�����ʱ���ر��������ַ�
let g:vimwiki_CJK_length = 1
 
" Wiki �п��õ� HTML ��ǩ
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
"}}}
