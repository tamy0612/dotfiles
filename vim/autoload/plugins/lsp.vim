"==========================================================
" vim/autoload/plugins/lsp.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 10 Dec. 2018.
"==========================================================

function! plugins#lsp#on_ft() abort
  return ['c', 'cpp']
endfunction

function! plugins#lsp#register_lsp() abort
  if executable('clangd')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info -> ['clangd']},
          \ 'whitelist': ['c', 'cpp']
          \})
    au FileType c,cpp setlocal omnifunc=lsp#complete
  endif
endfunction
" vim:ft=vim:ts=2:sw=2:fdm=marker
