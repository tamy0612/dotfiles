" Base config
let g:syntastic_mode_map = {'mode': 'passive'}

" C/C++ config
let g:syntastic_cpp_compiler_options = "-std=c++1y"
let include_list = [
      \ '/usr/include',
      \ '/usr/local/include',
      \ '.',
      \ './src',
      \ './include',
      \ ]
let g:syntastic_c_include_dirs = include_list
let g:syntastic_cpp_include_dirs = include_list
unlet include_list

" Python config
let g:syntastic_python_checkers = ['flake8']
