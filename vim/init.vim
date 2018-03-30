"==========================================================
" vim/init.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 02 Apr. 2018.
"==========================================================
if has('nvim') && exists('$XDG_CONFIG_DIR')
  let $VIMDIR = $XDG_CONFIG_DIR . '/nvim'
else
  let $VIMDIR = fnamemodify(expand('<sfile>'), ':h:p')
endif

function! s:source_config(filename, ...) abort
  let parent = get(a:000, 0, 'config')
  execute 'source' fnameescape(join([$VIMDIR, parent, a:filename], '/'))
endfunction

augroup MyCmdGroup
  autocmd!
augroup END

if has('vim_starting')
  call s:source_config('on_starting.vim')
endif
let mapleader = "\<Space>"


call s:source_config('dein.vim')
filetype plugin indent on
syntax enable

call s:source_config('options.vim')
call s:source_config('mappings.vim')
call s:source_config('colorscheme.vim')
call s:source_config('autocmd.vim')


" Load local vimrc
let s:local_vimrc = findfile('.vimrc.local', '.;')
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif
" vim:ft=vim:ts=2:sw=2:fdm=marker
