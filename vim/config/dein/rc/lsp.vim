"==========================================================
" vim/config/dein/rc/lsp.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 26 Apr. 2018.
"==========================================================
function! s:set_server_command(command, ...) abort
  if executable(a:command)
    for target in a:000
      let g:LanguageClient_serverCommands[target] = [a:command]
      execute 'autocmd MyCmdGroup FileType ' . target . ' setlocal omnifunc=LanguageClient#complete'
    endfor
  else
    call vimrc#error("'" . a:command . "' not found")
  endif
endfunction

" Rust
call s:set_server_command('rls', 'rust')

" JS/TS
let s:server = vimrc#find_executable(
      \ 'node_modules/javascript-typescript-langserver/lib/language-server-stdio.js',
      \ [getcwd(), '$VIMDIR/..'])
call s:set_server_command(s:server, 'javascript', 'typescript')
" vim:ft=vim:ts=2:sw=2:fdm=marker
