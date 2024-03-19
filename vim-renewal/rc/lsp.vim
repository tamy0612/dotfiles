let g:lsp_signature_help_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '!'}
let g:lsp_diagnostics_signs_hint = {'text': 'H'}
let g:lsp_insert_test_enabled = 0
let g:lsp_text_edit_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = vimrc#version#check(9, 0) && vimrc#version#is_patched(178)
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = g:lsp_diagnostics_virtual_text_enabled
let g:lsp_diagnostics_virtual_text_prefix = " ‣ "
let g:lsp_diagnostics_virtual_text_align = "after"
let g:lsp_diagnostics_virtual_text_padding_left = 2
let g:lsp_diagnostics_virtual_text_wrap = "truncate"
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_inlay_hints_enabled = vimrc#version#check(9, 0) && vimrc#version#is_patched(167)
let g:lsp_inlay_hints_mode = { 'normal': ['curline'] }
let g:lsp_hover_ui = 'float'


highlight link LspErrorHighlight ErrorMsg
highlight link LspWarningHighlight Question

highlight link LspErrorVirtualText LspErrorHighlight
highlight link LspWarningVirtualText LspWarningHighlight
highlight link LspInformationVirtualText Comment
highlight link LspHintVirtualText Comment

highlight link lspInlayHintsType DiagnosticFloatingHint
highlight link lspInlayHintsParameter DiagnosticFloatingHint

call popup_preview#enable()
let g:signature_help_config = #{
      \   contentsStyle: 'labels',
      \   viewStyle: 'floating'
      \ }
call signature_help#enable()

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gh <plug>(lsp-hover)
  nmap <buffer> <C-n> <plug>(lsp-next-diagnostic)
  nmap <buffer> <C-p> <plug>(lsp-previous-diagnostic)
endfunction

augroup enable_lsp
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

if vimrc#executable('clangd')
  autocmd User lsp_setup call lsp#register_server({
        \   'name': 'clangd',
        \   'cmd': {serverInfo->['clangd', '--background-index', '--clang-tidy']},
        \   'allowlist': ['c', 'cc', 'cpp', 'cu'],
        \ })
endif

if vimrc#executable('rust-analyzer')
  autocmd User lsp_setup call lsp#register_server({
        \   'name': 'rust-analyzer',
        \   'cmd': {serverInfo->['rust-analyzer']},
        \   'allowlist': ['rust'],
        \ })
endif

if vimrc#executable('gopls')
  autocmd User lsp_setup call lsp#register_server({
        \   'name': 'gopls',
        \   'cmd': {serverInfo->['gopls']},
        \   'allowlist': ['go'],
        \ })
endif

if vimrc#executable('typescript-language-server')
  autocmd User lsp_setup call lsp#register_server({
        \   'name': 'typescript-language-server',
        \   'cmd': {serverInfo->['typescript-language-server', '--stdio']},
        \   'allowlist': ['typescript', 'typescriptreact'],
        \ })
endif
" vim:ft=vim:ts=2:sw=2:fdm=marker
