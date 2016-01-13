function! commands#json#jq(...)
  if !executable('jq')
    echomsg "command 'jq' is not found in this system."
    return
  endif
  let l:arg = a:0 == 0 ? "." : a:1
  execute "%! jq \"" . l:arg . "\""
endfunction
