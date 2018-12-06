"==========================================================
" vim/autoload/plugins/neoformat.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 06 Dec. 2018.
"==========================================================
function! plugins#neoformat#register_formatter() abort
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

  " Rust
  if executable('rustfmt')
    let g:neoformat_rust_rustfmt = {
          \ 'exe': 'rustfmt',
          \ 'args': ['--skip-children', '--single-line-if-else']
          \}
    let g:neoformat_enabled_rust = ['rustfmt']
    let g:neoformat_rules.rust = {
          \ 'filetype': 'rust',
          \ 'pattern': '*.rs',
          \}
  endif

  " Python
  let g:neoformat_enabled_python = ['autopep8']
  let g:neoformat_rules.python = {
        \ 'filetype': 'python',
        \ 'pattern': '*.py',
        \}

  " Scala
  if executable('scalafmt')
    let g:neoformat_scala_scalafmt = {
          \ 'exe': 'scalafmt',
          \ 'args': [],
          \ 'replace': 1
          \}
    let g:neoformat_enabled_scala = ['scalafmt']
    let g:neoformat_rules.scala = {
          \ 'filetype': 'scala',
          \ 'pattern': '*.scala',
          \}
  endif

  for config in keys(g:neoformat_rules)
    execute 'autocmd' 'MyCmdGroup BufWritePre ' . g:neoformat_rules[config].pattern . ' Neoformat! ' . config
    execute 'autocmd' 'MyCmdGroup FileType ' . g:neoformat_rules[config].filetype . ' nnoremap <buffer> = :<C-u>Neoformat! ' . config . '<CR>'
  endfor
endfunction
" vim:ft=vim:ts=2:sw=2:fdm=marker
