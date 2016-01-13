let g:syntastic_error_symbol='x'
let g:syntastic_warning_symbol='!'
let g:syntastic_style_error_symbol = 'x'
let g:syntastic_style_warning_symbol = '!'

let g:syntastic_mode_map = {
      \ 'mode': 'passive',
      \ 'active_filetypes': [
      \   'c', 'cpp', 'python'
      \ ]}
"let g:syntastic_ruby_checkers = ['rubocop'] " or ['rubocop', 'mri']
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_coffee_checkers = ['coffeelint']
"let g:syntastic_scss_checkers = ['scss_lint']

let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 3
let g:syntastic_always_populate_loc_list = 2

" C/C++ config
let g:syntastic_ignore_files = ['\m^/usr\(/local\)\-/\(include\|lib\)']
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

hi SyntasticErrorSign ctermfg=160
hi SyntasticWarningSign ctermfg=220
