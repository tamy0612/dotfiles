"==========================================================
" vim/rc/linter_config.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" License: MIT License
"==========================================================

if executable('ccls')
  autocmd User lsp_setup call lsp#register_server({
        \   'name': 'ccls',
        \   'cmd': ['ccls'],
        \   'allowlist': ['c', 'cpp']
        \ })
endif

if executable('texlab')
  autocmd User lsp_setup call lsp#register_server({
        \   'name': 'texlab',
        \   'cmd': ['texlab'],
        \   'allowlist': ['tex', 'latex']
        \ })
endif

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'c': ['clang-format'],
      \   'cpp': ['clang-format'],
      \   'rust': ['rustfmt']
      \}

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal tagfunc=lsp#tagfunc
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> ge <plug>(lsp-type-definition)
  nmap <buffer> gR <plug>(lsp-rename)
  nmap <buffer> gA <Plug>(lsp-code-action)
  nmap <buffer> gs <Plug>(lsp-document-symbol-search)

  nmap <silent> <C-p> <Plug>(ale_previous_wrap)
  nmap <silent> <C-n> <Plug>(ale_next_wrap)
  nmap <silent> <C-k> <Plug>(ale_detail)
endfunction

autocmd MyCmdGroup User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

" vim:ft=vim:ts=2:sw=2:fdm=marker
