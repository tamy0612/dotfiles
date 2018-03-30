"==========================================================
" vim/config/autocmd.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 02 Apr. 2018.
"==========================================================
autocmd MyCmdGroup BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 1
autocmd MyCmdGroup BufWritePre * call vimrc#auto_mkdir_on_write(expand('<afile>:p:h'), v:cmdbang)
autocmd MyCmdGroup BufWritePost $MYVIMRC source $MYVIMRC
autocmd MyCmdGroup FileType gitcommit execute "normal! gg"

if vimrc#is_nvim()
  autocmd MyCmdGroup BufRead,BufNewFile *.nvim setlocal filetype=vim
  autocmd MyCmdGroup CursorHold * if exists(':rshada') | rshada | wshada | endif
endif
" vim:ft=vim:ts=2:sw=2:fdm=marker
