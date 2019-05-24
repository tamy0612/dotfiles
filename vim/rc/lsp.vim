"==========================================================
" vim/rc/lsp.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 24 May. 2019.
"==========================================================
let g:lsp_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '!'}

" C/C++
let s:commands_file = lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json')
if executable('cquery') && filereadable(s:commands_file)
  autocmd MyCmdGroup User lsp_setup call lsp#register_server({
        \ 'name': 'cquery',
        \ 'cmd': {server_info -> ['cquery']},
        \ 'root_uri': {server_info -> lsp#utils#path_to_uri(s:commands_file)},
        \ 'initialization_options': {'cacheDirectory': '$XDG_CACHE_HOME/cquery/cache'},
        \ 'whitelist': ['c', 'cpp']
        \})
elseif executable('clangd')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info -> ['clangd']},
        \ 'whitelist': ['c', 'cpp']
        \})
endif

" Typescript
let s:typescript_lib_dir = 'node_modules/typescript-language-server/lib'
let s:typescript_lsp_dir = lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), s:typescript_lib_dir)
if s:typescript_lsp_dir !=# ''
  let s:typescript_lsp = s:typescript_lsp_dir . '/cli.js'
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag,s:typescript_lsp . ' --stdio']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(
        \   lsp#utils#find_nearest_parent_file_directory(
        \     lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript']
        \})
endif
" vim:ft=vim:ts=2:sw=2:fdm=marker
