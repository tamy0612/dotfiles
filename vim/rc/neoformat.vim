"==========================================================
" vim/rc/neoformat.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 28 Apr. 2020.
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

" Golang
if executable('go')
  let g:neoformat_go_gofmt = {
        \ 'exe': 'go',
        \ 'args': ['fmt'],
        \ 'replace': 1
        \}
  let g:neoformat_enabled_go = ['gofmt']
  let g:neoformat_rules.go = {
        \ 'filetype': 'go',
        \ 'pattern': '*.go',
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

" TypeScript
let s:tsfmt_dir = vimrc#find_nearest_parent_dir(getcwd(), "node_modules/typescript-formatter/bin")
if s:tsfmt_dir !=# ''
  let g:neoformat_typescript_tsfmt = {
        \ 'exe': s:tsfmt_dir . '/tsfmt',
        \ 'args': [],
        \ 'replace': 1
        \}
  let g:neoformat_enabled_typescript = ['tsfmt']
  let g:neoformat_rules.typescript = {
        \ 'filetype': 'typescript',
        \ 'pattern': '*.ts,*.tsx'
        \}
endif

for config in keys(g:neoformat_rules)
  execute 'autocmd' 'MyCmdGroup BufWritePre ' . g:neoformat_rules[config].pattern . ' Neoformat! ' . config
  execute 'autocmd' 'MyCmdGroup FileType ' . g:neoformat_rules[config].filetype . ' nnoremap <buffer> = :<C-u>Neoformat! ' . config . '<CR>'
endfor
" vim:ft=vim:ts=2:sw=2:fdm=marker
