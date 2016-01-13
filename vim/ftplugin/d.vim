if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal commentstring=//%s

setlocal include=^\s*import
setlocal path=$D_IMPORT_DIR,.,./src,./source
setlocal includeexpr=substitute(v:fname,'\\.','/','g')

if exists('$DC')
  compiler $DC
endif
