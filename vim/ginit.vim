"==========================================================
" vim/ginit.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 02 Apr. 2018.
"==========================================================
set showtabline=2
set imdisable
set antialias
set guifont=Ricty\ 12
set guioptions& guioptions-=T
set guicursor=a:blinkon0
set lines=52 columns=120
if vimrc#is_windows()
  set transparency=10
endif

autocmd MyCmdGroup BufWritePost $MYGVIMRC source $MYGVIMRC
" vim:ft=vim:ts=2:sw=2:fdm=marker
