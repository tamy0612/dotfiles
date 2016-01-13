"==========================================================
" Write hook
"==========================================================
" auto_mkdir
"   make a directory semi-automatically when the dir does not exist
function! hook#write#auto_mkdir( dir, cmdbang ) "{{{
  if !isdirectory( a:dir ) && (
        \ a:cmdbang || input(
        \                 printf(
        \                   '"%s" does not exist. Create? [y/N] : ',
        \                   a:dir
        \                 )
        \               ) =~? '^y\%[es]$' ) "{{{
    call mkdir( iconv( a:dir, &encoding, &termencoding ), 'p' )
  endif "}}}
endfunction "}}}

" space_clean
"   remove extra spaces
function! hook#write#space_clean() "{{{
  let cursor = getpos(".")
  %s/^ *$//ge
  %s/\s\+$//gec
  call setpos( ".", cursor )
  unlet cursor
endfunction "}}}
