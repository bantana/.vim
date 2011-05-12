"----------- base setting -----------
" ���� Pathhogen
call pathogen#runtime_append_all_bundles()

" �����﷨
syntax on
behave mswin
filetype plugin on

"���ڵ����м����
set lbr

"�򿪶���ģ�����������֧��
set fo+=mB

" �Զ����뵱ǰ�༭�ļ���Ŀ¼
set autochdir

" ������
let g:havemanu=0
set go=

" ��Ҫvimģ��viģʽ
set nocompatible

" ��һ��tab����4���ո�
set shiftwidth=4
set softtabstop=4

" ��ʾ�к�
set number

" ����ʱĬ�ϴ�С {{{
" ����ʲô����������������ߴ�
set lines=140 columns=82

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
set foldmethod=marker

" encoding
set encoding=utf-8
set termencoding=utf-8

"�ж���ǰ����ϵͳ����
if(has("win32") || has("win95") || has("win64") || has("win16")) 
    let g:iswindows=1
else
    let g:iswindows=0
endif

if g:iswindows==1
    set fileencoding=utf-8
	"language messages zh_cn.utf-8
else
    set fileencoding=utf-8
endif
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.utf-8
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim

"�����ź�����
set guifont=YaHei\ Consolas\ Hybrid\ 8
"set guifont=Lucida\ Console:h8

" ȡ���Զ����ݹ���
set nobackup
set nowritebackup

" ��������
colorscheme lilypink 

" Set mapleader
let mapleader = ","
