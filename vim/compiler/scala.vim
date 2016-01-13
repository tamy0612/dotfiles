if exists( 'current_compiler' )
  finish
endif
let current_compiler = 'scala'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=scalac\ %
CompilerSet errorformat=%f:%l:\ error:\ %m,%-Z%p^,%-C%.%#,%-G%.%#

let &cpo = s:save_cpo
unlet s:save_cpo
