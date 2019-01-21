"==========================================================
" vim/autoload/plugins/asyncomplete.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 10 Dec. 2018.
"==========================================================
function! plugins#asyncomplete#clang_home() abort
  if exists('g:clang_home')
    return g:clang_home
  elseif vimrc#is_osx()
    return expand('$BREW_HOME/opt/llvm')
  else
  endif
endfunction

" vim:ft=vim:ts=2:sw=2:fdm=marker
