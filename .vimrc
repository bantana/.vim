" ����û��ʲô���ã����ô����������ļ���

" ���� $ ����
if has("win32")
  let $VIMFILES = $VIM.'/vimfiles/'
  let $V = $VIM.'/_vimrc'
else
  let $VIMFILES = $HOME.'/.vim/'
  let $V = $HOME.'/.vimrc'
endif
let $CONF = $VIMFILES.'/conf/'
let $PLUGIN = $VIMFILES.'/Plugin/'

" ���� base ����
source $CONF\base.vim
" �����Զ��幦��
source $CONF\customFeture.vim
" �����Զ����ݼ�
source $CONF\customShortcut.vim
" ����һ��������
source $CONF\pluginConf.vim
" ������ʺ�����Ĳ������
source $CONF\pluginConfSc.vim

"------------����---------------{{{
set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"}}}
