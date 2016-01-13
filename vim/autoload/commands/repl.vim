function! commands#repl#define( dict )
  for repl in items(a:dict)
    execute "command! -nargs=0 ".repl[0]." :VimShellInteractive ".repl[1]
  endfor
endfunction
