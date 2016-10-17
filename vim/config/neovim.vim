augroup MyCmdGroup
  autocmd BufRead,BufNewFile *.nvim set filetype=vim
  autocmd CursorHold * if exists(':rshada') | rshada | wshada | endif

  command! -nargs=? VsTerminal :vsplit| term <args>
  command! -nargs=? SpTerminal :split|resize 20| term <args>
  command! -nargs=0 Project    :call s:open_project()
  command! -nargs=? ToggleTerm :call s:popup_terminal_toggle(<q-args>)
augroup END

function! s:popup_terminal_toggle(...)
  let l:popup_terminal_name = "terminal:".get(a:000, 0, "popup")
  let l:popup_terminal_bufnr = bufnr(l:popup_terminal_name)
  let l:popup_terminal_winnr = bufwinnr(l:popup_terminal_name)
  if l:popup_terminal_bufnr > 0
    if l:popup_terminal_winnr == bufwinnr('%')
      hide
    elseif l:popup_terminal_winnr > 0
      exec l:popup_terminal_winnr . "wincmd w"
      startinsert
    else
      execute "silent! split| resize 20| buffer ".l:popup_terminal_name
      startinsert
    endif
  else
    SpTerminal
    execute "silent! file ".l:popup_terminal_name
  endif
endfunction

function! s:open_project()
  ToggleTerm project
  NERDTree
endfunction

" Use cursor shape feature
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Mappings
tnoremap <ESC> <C-\><C-n>
nnoremap <silent> <Leader>t :<C-u>ToggleTerm<CR>
