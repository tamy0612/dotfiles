if exists("b:did_ftplugin")
  finish
endif

setlocal ts=2 sw=2
setlocal cinoptions-=g4
setlocal cinoptions+=g2

"setlocal textwidth=80
"if exists('&colorcolumn')
"  setlocal colorcolumn=+1
"endif

setlocal include=\s*import
setlocal includeexpr=substitute(v:fname,'\\.','/','g')

compiler scala

" sbt
runtime! ftplugin/sbt.vim

let b:did_ftplugin = 1
