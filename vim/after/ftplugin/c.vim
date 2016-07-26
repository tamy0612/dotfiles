if exists("b:did_cpp_ftplugin")
  finish
endif
let b:did_cpp_ftplugin = 1
let c_syntax_for_h = 1

setlocal commentstring=//%s
setlocal path+=/usr/local/include,.,./src,./source
