" ����û��ʲô���ã����ô����������ļ���

" ���� $ ����
if has("win32")
  let $vimfiles = $VIM.'/vimfiles/'
  let $v = $VIM.'/_vimrc'
else
  let $vimfiles = $HOME.'/.vim/'
  let $v = $HOME.'/.vimrc'
endif
let $conf = $vimfiles.'/conf/'
let $base = $conf.'/base.vim'
let $plugin = $vimfiles.'/plugins/'

" ������
source $conf\pluginManager.vim
" ���� base ����
source $conf\base.vim
" ������ʺ�����Ĳ������
source $conf\pluginConfSc.vim
