let g:ale_linters = get(g:, 'ale_linters', {})

" Locals  "{{{
let s:default_errorformat = '%f:%l:%c: %m'
let s:pip_bin = $PYENV_ROOT . '/versions/neovim3/bin/'

function! s:find_exe(...)
    for l:path in a:000
        if executable(l:path)
            return l:path
        endif
    endfor
    return a:0
endfunction
"}}}


" C/C++  "{{{
let g:ale_c_clang_options = '-std=c11 -Wall -c -O0 -I. -I./src -I./include'
let g:ale_c_gcc_options = g:ale_c_clang_options
let g:ale_linters.c = ['clang', 'gcc']

let g:ale_cpp_clagn_options = '-std=c++1z -Wall -c -O0 -I. -I./src -I./include'
let g:ale_cpp_gcc_options = g:ale_cpp_clagn_options
let g:ale_linters.cpp = g:ale_linters.c
"}}}


" Dlang  "{{{
let g:ale_d_dscanner_executable = 'dscanner'
let g:ale_d_dscanner_options = '--styleCheck'
if executable(g:ale_d_dscanner_executable)
    let g:ale_linters.d = ['dmd', 'dscanner']
endif
"}}}


" Python  "{{{
let g:ale_python_flake8_executable = s:find_exe('flake8', s:pip_bin . 'flake8')
let g:ale_python_flake8_options = '--ignore=E221,E241,E272,E251,W702,E203,E201,E202 --format=default'
"}}}
