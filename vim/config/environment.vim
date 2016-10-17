let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin  = has('win32unix')
let s:is_sudo    = $SUDO_USER !=# '' && $USER !=# $SUDO_USER
                   \ && $HOME !=# expand('~'.$USER)
                   \ && $HOME ==# expand('~'.$SUDO_USER)
let s:is_gui     = has('gui_running')
let s:is_nvim    = has('nvim')

function! IsWindows() abort
  return s:is_windows || s:is_cygwin
endfunction

function! IsMac() abort
  return !IsWindows()
          \ && ( has('mac') || has('macunix') || has('gui_macvim')
          \      || ( !executable('xdg-open') && system('uname') =~? '^darwin' ) )
endfunction

function! IsLinux() abort
  return !IsWindows() && !IsMac() && has('unix')
endfunction

function! IsSUDO() abort
  return s:is_sudo
endfunction

function! IsGUI() abort
  return s:is_gui
endfunction

function! IsNVim() abort
  return s:is_nvim
endfunction
