function! vimrc#is_startup() abort
  return has('vim_starting')
endfunction

function! vimrc#toggle_variable(var) abort
  execute "let " . a:var . " = !" . a:var
endfunction

function! vimrc#open_qf_or_loclist() abort
  if !empty(getqflist())
    execute "copen"
    return
  endif
  if !empty(getloclist(winnr()))
    execute "lopen"
    return
  endif
endfunction

let s:is_executable = {}
function! vimrc#executable(cmd) abort
  let s:is_executable[a:cmd] = get(s:is_executable, a:cmd, executable(a:cmd))
  return s:is_executable[a:cmd]
endfunction
" vim:ft=vim:ts=2:sw=2
