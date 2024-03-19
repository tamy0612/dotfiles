let g:ale_enabled = 0
let g:ale_disable_lsp = 0
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'c': ['clang-format'],
      \   'cpp': ['clang-format'],
      \   'go': ['gofmt', 'goimports'],
      \   'rust': ['rustfmt'],
      \   'typescript': ['prettier'],
      \   'typescriptreact': ['prettier'],
      \   'javascript': ['prettier'],
      \   'javascriptreact': ['prettier'],
      \   'css': ['prettier'],
      \}

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
" vim:ft=vim:ts=2:sw=2:fdm=marker
