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

let g:ale_linters = {
      \   'c': ['vim-lsp'],
      \   'cpp': ['vim-lsp'],
      \}

" vim:ft=vim:ts=2:sw=2:fdm=marker
