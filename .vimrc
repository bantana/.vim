" ����û��ʲô���ã����ô����������ļ���

" ���� $ ����
if has("win32")
  let $VIMFILES = $VIM.'/vimfiles/'
  let $V = $VIM.'/_vimrc'
else
  let $VIMFILES = $HOME.'/.vim/'
  let $V = $HOME.'/.vimrc'
endif
let $conf = $VIMFILES.'/conf/'
let $base = $conf.'/base.vim'
let $PLUGIN = $VIMFILES.'/Plugin/'

" ������
source $conf\pluginManager.vim
" ���� base ����
source $conf\base.vim
" ������ʺ�����Ĳ������
source $conf\pluginConfSc.vim
