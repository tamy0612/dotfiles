if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal conceallevel=0
let g:tex_conceal = 0
setlocal commentstring=\%%s
