"==========================================================
" vim/config/dein/rc/ale.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 26 Apr. 2018.
"==========================================================
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
let g:ale_c_clang_options = '-std=c11 -Wall -I. -I./src -I./include'
let g:ale_c_gcc_options = g:ale_c_clang_options
let g:ale_linters.c = ['clang', 'gcc']

let g:ale_cpp_clagn_options = '-std=c++1z -Wall -I. -I./src -I./include'
let g:ale_cpp_gcc_options = g:ale_cpp_clagn_options
let g:ale_linters.cpp = g:ale_linters.c
"}}}


" Dlang  "{{{
let g:ale_linters.d = ['dmd']
let g:ale_d_dscanner_executable = 'dscanner'
let g:ale_d_dscanner_options = '--styleCheck'
if executable(g:ale_d_dscanner_executable)
  let g:ale_linters.d = extend(g:ale_linters.d, ['dscanner'])
endif
"}}}


" Rust  "{{{
let g:ale_linters.rust = []
if executable('rls')
  let g:ale_rust_rls_toolchain = 'stable'
  let g:ale_linters.rust = extend(g:ale_linters.rust, ['rls'])
endif
if executable('rustc')
  let g:ale_rust_rustc_options = '-W warnings -W bad-style'
  let g:ale_linters.rust = extend(g:ale_linters.rust, ['rustc'])
endif
"}}}


" Typescript  "{{{
let s:tsc = vimrc#find_executable('tsc',
      \ [getcwd() . '/node_modules/typescript/bin', '$VIMDIR/../node_modules/typescript/bin'])
if s:tsc != ''
  let g:ale_typescript_tsc_executable = s:tsc
  " let g:ale_typescript_tsc_options = ""
  let g:ale_linters.typescript = ['tsc']
endif
"}}}


" Python  "{{{
let g:ale_python_flake8_executable = s:find_exe('flake8', s:pip_bin . 'flake8')
let g:ale_python_flake8_options = '--ignore=E221,E241,E272,E251,W702,E203,E201,E202 --format=default'
"}}}


" PHP  "{{{
let g:ale_linters.php = ['php']
"}}}
" vim:ft=vim:ts=2:sw=2:fdm=marker