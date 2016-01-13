if exists( 'current_compiler' )
  finish
endif
let current_compiler = 'php'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=php\ -l\ %
CompilerSet errorformat=%m\ in\ %f\ on\ line\ %l

let &cpo = s:save_cpo
unlet s:save_cpo
