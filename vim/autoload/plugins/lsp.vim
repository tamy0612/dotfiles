"==========================================================
" vim/autoload/plugins/lsp.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 30 Jan. 2019.
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
  if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'typescript-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag,'typescript-language-server --stdio']},
          \ 'root_uri': {server_info->lsp#utils#path_to_uri(
          \   lsp#utils#find_nearest_parent_file_directory(
          \     lsp#utils#get_buffer_path(), 'tsconfig.json'))},
          \ 'whitelist': ['typescript']
          \})
  endif
endfunction
" vim:ft=vim:ts=2:sw=2:fdm=marker
