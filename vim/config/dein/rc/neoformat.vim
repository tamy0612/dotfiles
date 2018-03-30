"==========================================================
" vim/config/dein/rc/neoformat.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 02 Apr. 2018.
"==========================================================
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1
let g:neoformat_rules = get(g:, 'neoformat_rules', {})

" C/C++
let g:neoformat_cpp_clangformat = get(g:, 'neoformat_cpp_clangformat', {})
let g:neoformat_cpp_clangformat.exe = 'clang-format'
let g:neoformat_cpp_clangformat.args = ['-style=file']
let g:neoformat_cpp_clangformat.stdin = 1
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_rules.cpp = {
      \ 'filetype': 'c,cpp',
      \ 'pattern': '*.c,*.cc,*.cpp,*.h,*.hpp',
      \}

" Dlang
let g:neoformat_d_dfmt = {}
let g:neoformat_enebaled_d = ['dfmt']
let g:neoformat_rules.d = {
      \ 'filetype': 'd',
      \ 'pattern': '*.d',
      \}

" Python
let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_rules.python = {
      \ 'filetype': 'python',
      \ 'pattern': '*.py',
      \}
" vim:ft=vim:ts=2:sw=2:fdm=marker
