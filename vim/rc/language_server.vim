function! s:on_lsp_buffer_enabled() abort
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> ge <plug>(lsp-type-definition)
  nmap <buffer> gR <plug>(lsp-rename)
  nmap <buffer> gA <Plug>(lsp-code-action)
  nmap <buffer> gs <Plug>(lsp-document-symbol-search)
endfunction

autocmd MyCmdGroup User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

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

if executable('rust-analyzer')
    autocmd User lsp_setup call lsp#register_server({
        \   'name': 'rust-analyzer',
        \   'cmd': {serverInfo->['rust-analyzer']},
        \   'allowlist': ['rust'],
        \ })
endif
