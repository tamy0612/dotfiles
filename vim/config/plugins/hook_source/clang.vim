let g:clang_auto = 1
let g:clang_diagsopt = ''
let g:clang_format_auto = executable('clang-format')
let g:clang_include_sysheaders_from_gcc = executable('clang')
let g:clang_verbose_pmenu = 0

let g:clang_c_completeopt   = 'menuone,noselect,longest,preview'
let g:clang_cpp_completeopt = 'menuone,noselect,longest,preview'

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z'
if IsMac()
    let g:clang_cpp_options = g:clang_cpp_options . ' -stdlib=libc++'
endif
