augroup MyCmdGroup
  autocmd BufRead,BufNewFile *.nvim set filetype=vim
  autocmd CursorHold * if exists(':rshada') | rshada | wshada | endif
augroup END

" Use mouse if available
if has('mouse')
    set mouse+=a
endif

" Use cursor shape feature
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Mappings
tnoremap <ESC> <C-\><C-n>
