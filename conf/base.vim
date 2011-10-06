"----------- base setting -----------
colorscheme lilypink                   " ��������
let mapleader = ','                    " Set mapleader
set linebreak                          " ���ڵ����м����
set formatoptions+=mB                  " �򿪶���ģ�����������֧��
set autochdir                          " �Զ����뵱ǰ�༭�ļ���Ŀ¼
set guioptions=                        " ������
"set ignorecase                         " ���Դ�Сдƥ��
set scrolloff=10                       " ���ù��������±߽�ľ���
set showcmd                            " �ڴ������½���ʾ�������������벿��
set cursorline                         " �������������
set nocompatible                       " ��Ҫvimģ��viģʽ
set number                             " ��ʾ�к�
set guifont=YaHei\ Consolas\ Hybrid\ 9 " �����ź�����
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

" ����ʱĬ�ϴ�С {{{
" ����ʲô����������������ߴ�
set lines=44 columns=84

" GUI ������ʽ�ߴ�
"au GUIEnter * set lines=140 columns=82

" ��������ʽ�趨�ߴ�
if has("gui_running")
  " GUI is running or is about to start.
  " set gvim window size
"  set lines=140 columns=82
else
  " This is console Vim.
  if exists("+lines")
"    set lines=140
  endif
  if exists("+columns")
"    set columns=82
  endif
endif

" ���������
" Maximize gvim on startup. Note we Dutch must use ~m, English/American people use ~x
"au GUIEnter * simalt ~x
"au GUIEnter * simalt ~m
"au GUIEnter * simalt ~v
"}}}

" ���ض������Ϊ�۵�����
let g:foldIsMarker=1
set foldmethod=marker

" encoding
set encoding=utf-8
set termencoding=utf-8

"�ж���ǰ����ϵͳ���� {{{
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
" }}}

" ȡ���Զ����ݹ���
set nobackup
set nowritebackup
