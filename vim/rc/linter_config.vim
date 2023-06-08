"==========================================================
" vim/rc/linter_config.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" License: MIT License
"==========================================================

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_floating_preview = 1
let g:ale_open_list             = 1
let g:ale_keep_list_window_open = 0
let g:ale_hover_cursor = 1
let g:ale_lint_on_text_changed  = 'normal'
let g:ale_lint_on_enter         = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
let g:ale_echo_msg_error_str    = g:ale_sign_error
let g:ale_echo_msg_warning_str  = g:ale_sign_warning
let g:ale_echo_msg_format       = '[%linter%] %s [%severity%]'

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'c': ['clang-format'],
      \   'cpp': ['clang-format'],
      \   'rust': ['rustfmt']
      \}

let g:lsp_ale_auto_enable_linter = 1

" vim:ft=vim:ts=2:sw=2:fdm=marker
