"==========================================================
" vim/config/colorscheme.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 06 Apr. 2018.
"==========================================================
setglobal background=dark
colorscheme iceberg

if exists('*dein#tap') && dein#tap('onedark.vim')
  let g:lightline.colorscheme = 'onedark'
endif
" vim:ft=vim:ts=2:sw=2:fdm=marker
