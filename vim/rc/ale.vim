"==========================================================
" vim/rc/ale.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 03 Mar. 2019.
"==========================================================
function! s:find_exe(...)
  for l:path in a:000
    if executable(l:path)
      return l:path
    endif
  endfor
  return a:0
endfunction

let g:ale_linters = get(g:, 'ale_linters', {})

let s:default_errorformat = '%f:%l:%c: %m'
let s:pip_bin = $PYENV_ROOT . '/versions/neovim3/bin/'

" C
let g:ale_c_clang_options = get(g:, 'ale_c_options', '-std=c11 -Wall -I. -I./src -I./include')
let g:ale_c_gcc_options = g:ale_c_clang_options
let g:ale_linters.c = ['clang', 'gcc', 'cquery']

" C++
let g:ale_cpp_clagn_options = get(g:, 'ale_cpp_options', '-std=c++17 -Wall -I. -I./src -I./include')
let g:ale_cpp_gcc_options = g:ale_cpp_clagn_options
let g:ale_linters.cpp = ['clang++', 'g++', 'cquery']

" Dlang
let g:ale_linters.d = ['dmd']
let g:ale_d_dscanner_executable = 'dscanner'
let g:ale_d_dscanner_options = '--styleCheck'
if executable(g:ale_d_dscanner_executable)
  let g:ale_linters.d = extend(g:ale_linters.d, ['dscanner'])
endif

" Rust
let g:ale_linters.rust = []
if executable('rls')
  let g:ale_rust_rls_toolchain = 'stable'
  let g:ale_linters.rust = extend(g:ale_linters.rust, ['rls'])
endif
if executable('rustc')
  let g:ale_rust_rustc_options = '-W warnings -W bad-style'
  let g:ale_linters.rust = extend(g:ale_linters.rust, ['rustc'])
endif

" typescript
let g:ale_linters.typescript = []
let s:tslint_dir = vimrc#find_nearest_parent_dir(getcwd(), 'node_modules/tslint/bin')
if s:tslint_dir !=# ''
  let g:ale_typescript_tslint_executable = s:tslint_dir . '/tslint'
  let g:ale_linters.typescript += ['tslint']
endif
let s:typescript_dir = vimrc#find_nearest_parent_dir(getcwd(), 'node_modules/typescript/bin')
if s:typescript_dir !=# ''
  let g:ale_typescript_tsc_executable = s:typescript_dir . '/tsc'
  let g:ale_typescript_tsserver_executable = s:typescript_dir . '/tsserver'
  let g:ale_linters.typescript += ['tsc', 'tsserver']
endif

" python
let g:ale_python_flake8_executable = s:find_exe('flake8', s:pip_bin . 'flake8')
let g:ale_python_flake8_options = '--ignore=E221,E241,E272,E251,W702,E203,E201,E202 --format=default'

" PHP
let g:ale_linters.php = ['php']

nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
" vim:ft=vim:ts=3:sw=2:fdm=marker
