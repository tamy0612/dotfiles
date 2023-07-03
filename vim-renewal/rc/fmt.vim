let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1

let g:format_rules = get(g:, 'format_rules', {})

" C/C++
let g:neoformat_cpp_clangformat = get(g:, 'neoformat_cpp_clangformat', {})
let g:neoformat_cpp_clangformat.exe = 'clang-format'
let g:neoformat_cpp_clangformat.args = ['-style=file']
let g:neoformat_cpp_clangformat.stdin = 1
let g:neoformat_enabled_cpp = ['clangformat']
let g:format_rules.cpp = {
      \ 'filetype': 'c,cpp',
      \ 'pattern': '*.c,*.cc,*.cpp,*.h,*.hpp',
      \}

" Dlang
let g:neoformat_d_dfmt = {}
let g:neoformat_enebaled_d = ['dfmt']
let g:format_rules.d = {
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
  let g:format_rules.rust = {
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
  let g:format_rules.go = {
        \ 'filetype': 'go',
        \ 'pattern': '*.go',
        \}
endif

" Python
let g:neoformat_enabled_python = ['autopep8']
let g:format_rules.python = {
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
  let g:format_rules.scala = {
        \ 'filetype': 'scala',
        \ 'pattern': '*.scala',
        \}
endif

" TypeScript
let s:tsfmt_dir = vimrc#fs#find_nearest_parent_dir(getcwd(), "node_modules/typescript-formatter/bin")
if s:tsfmt_dir !=# ''
  let g:neoformat_typescript_tsfmt = {
        \ 'exe': s:tsfmt_dir . '/tsfmt',
        \ 'args': [],
        \ 'replace': 1
        \}
  let g:neoformat_enabled_typescript = ['tsfmt']
  let g:format_rules.typescript = {
        \ 'filetype': 'typescript',
        \ 'pattern': '*.ts,*.tsx'
        \}
endif

" Elixir
if executable('mix')
  let g:neoformat_elixir_mixformat = {
        \   'exe': 'mix',
        \   'args': ['format'],
        \   'replace': 1
        \ }
  let g:neoformat_enabled_elixir = ['mixformat']
  let g:format_rules.elixir = {
        \   'filetype': 'elixir',
        \   'pattern': '*.ex,*,exs'
        \ }
endif

augroup fmt
  autocmd!
augroup END

for config in keys(g:format_rules)
  execute 'autocmd' 'fmt BufWritePre ' . g:format_rules[config].pattern . ' Neoformat! ' . config
  execute 'autocmd' 'fmt FileType ' . g:format_rules[config].filetype . ' nnoremap <buffer> = :<C-u>Neoformat! ' . config . '<CR>'
endfor
" vim:ft=vim:ts=2:sw=2:fdm=marker
