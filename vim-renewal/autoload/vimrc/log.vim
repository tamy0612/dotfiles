let s:record_normal = 0

function! vimrc#log#record_normal() abort
  let s:record_normal = 1
endfunction

function! vimrc#log#norecord_normal() abort
  let s:record_normal = 0
endfunction

function! vimrc#log#normal(...) abort
  let msg = '[vimrc] ' . join(a:000)
  if s:record_normal
    echomsg msg
  else
    echo msg
  endif
endfunction

function! vimrc#log#error(...) abort
  echoerr '[ERROR] ' . join(a:000)
endfunction
