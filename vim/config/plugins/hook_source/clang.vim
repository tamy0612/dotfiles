let g:clang_auto = 1
let g:clang_c_completeopt   = 'menuone,noselect,longest'
let g:clang_cpp_completeopt = 'menuone,noselect,longest'

let g:clang_c_options = '-std=c11'

let g:clang_cpp_options = '-std=c++1z'
if IsMac()
    let g:clang_cpp_options = g:clang_cpp_options . ' -stdlib=libc++'
endif
