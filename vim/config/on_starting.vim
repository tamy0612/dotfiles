"==========================================================
" vim/config/init.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 20 Aug. 2018.
"==========================================================
" Encoding
if &encoding !=? 'utf-8'
  let &termencoding = &encoding
  if !vimrc#is_nvim() | setglobal encoding=utf-8 | endif
endif
language message C
scriptencoding utf-8

setglobal fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,cp20932
setglobal fileformats=unix,mac,dos


setglobal helplang& helplang=en,ja
setglobal secure

" Path configuration for yacky OS
if vimrc#is_windows()
  setglobal runtimepath^=$VIMDIR
  setglobal runtimepath+=$VIMDIR/after
  setglobal shellslash
endif


" Cache dir.
if !exists('$VIM_CACHE_DIR')
  if exists('$XDG_CACHE_HOME')
    let $VIM_CACHE_DIR = expand("$XDG_CACHE_HOME/vim")
  else
    let $VIM_CACHE_DIR = expand('$HOME/.cache/vim')
  endif
endif
setglobal backupdir=$VIM_CACHE_DIR/back
call vimrc#mkdir_unless_exist(expand(&backupdir))


" nvim config
if vimrc#is_nvim()
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
  let g:python3_host_prog = vimrc#find_executable("python3", [
        \ $PYENV_ROOT . "/versions/neovim3/bin",
        \ $PYENV_ROOT . "/shims"
        \])
  " let g:python_host_prog = vimrc#find_executable("python", [
  "       \ $PYENV_ROOT . "/versions/neovim2/bin",
  "       \ $PYENV_ROOT . "/shims",
  "       \])
endif
" vim:ft=vim:ts=2:sw=2:fdm=marker
