function! s:check_windows() abort
  let is_windows = has('win16') || has('win32') || has('win64')
  let is_cygwin  = has('win32unix')
  return is_windows || is_cygwin
endfunction

function! s:check_osx() abort
  return has('mac') || has('macunix') || has('gui_macvim') || (!executable('xdg-open') && system('uname') =~? '^darwin')
endfunction

function! vimrc#platform#is_windows() abort
  let s:is_windows = get(s:, 'is_windows', s:check_windows())
  return s:is_windows
endfunction

function! vimrc#platform#is_osx() abort
  let s:is_osx = get(s:, 'is_osx', !vimrc#platform#is_winsows() && s:check_osx())
  return s:is_osx()
endfunction

function! vimrc#platform#is_linux() abort
  let s:is_linux = get(s:, 'is_linux', !vimrc#platform#is_windows() && !vimrc#platform#is_osx() && has('unix'))
  return s:is_linux
endfunction

function! vimrc#platform#is_sudu() abort
  return $SUDO_USER !=# '' && $USER !=# $SUDO_USER
        \ && $HOME !=# expand('~'.$USER)
        \ && $HOME ==# expand('~'.$SUDO_USER)
endfunction
