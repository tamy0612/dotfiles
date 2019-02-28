"==========================================================
" vim/autoload/vimrc.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 28 Feb. 2019.
"==========================================================
" Flags
function! vimrc#is_windows() abort
  let is_windows = has('win16') || has('win32') || has('win64')
  let is_cygwin  = has('win32unix')
  return is_windows || is_cygwin
endfunction

function! vimrc#is_osx() abort
  return !vimrc#is_windows()
        \ && ( has('mac') || has('macunix') || has('gui_macvim')
        \      || ( !executable('xdg-open') && system('uname') =~? '^darwin' ) )
endfunction

function! vimrc#is_linux() abort
  return !vimrc#is_windows() && !vimrc#is_osx() && has('unix')
endfunction

function! vimrc#is_sudu() abort
  return $SUDO_USER !=# '' && $USER !=# $SUDO_USER
        \ && $HOME !=# expand('~'.$USER)
        \ && $HOME ==# expand('~'.$SUDO_USER)
endfunction

function! vimrc#is_nvim() abort
  return has('nvim')
endfunction

function! vimrc#is_gvim() abort
  return has('gui_running')
endfunction

function! vimrc#is_vim8() abort
  return !vimrc#is_nvim() && v:version >= 800
endfunction

function! vimrc#is_obsolete_vim() abort
  return !vimrc#is_nvim() && v:version < 704
endfunction


" Utility functions
function! vimrc#log(...) abort
  echomsg '[vimrc] ' . join(a:000)
endfunction

function! vimrc#error(...) abort
  echomsg '[error] ' . join(a:000)
endfunction

function! vimrc#find_executable(cmd, ...) abort
  let l:candidate_dirs = get(a:000, 0, [])
  for candidate_dir in l:candidate_dirs
    let l:path = expand(join([candidate_dir, a:cmd], '/'))
    if executable(l:path)
      return l:path
    endif
  endfor
  if executable(a:cmd)
    return a:cmd
  endif
  call vimrc#error('Command not found: ' . a:cmd)
  return ''
endfunction

function! vimrc#mkdir_unless_exist(dirname) abort
  if !isdirectory(a:dirname)
    call vimrc#log('Create directory: ' . a:dirname)
    call mkdir(a:dirname, 'p')
  endif
endfunction

function! vimrc#auto_mkdir_on_write(dir, cmdbang) abort
  if !isdirectory(a:dir)
        \ && (
        \   a:cmdbang
        \   || input(printf('"%s" does not exist. Create? [y/N] : ', a:dir)) =~? '^y\%[es]$'
        \ )
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

function! vimrc#toggle_variable(var) abort
  execute "let " . a:var . " = !" . a:var
endfunction

function! vimrc#open_qf_or_loclist() abort
  if !empty(getqflist())
    execute "copen"
    return
  endif
  if !empty(getloclist(winnr()))
    execute "lopen"
    return
  endif
endfunction

function! vimrc#find_nearest_parent_dir(from, target) abort
  let l:path = finddir(a:target, a:from . ';')
  if empty(l:path)
    return ''
  endif
  return fnamemodify(l:path, ':p')
endfunction

" Default values
function! vimrc#default_colorscheme() abort
  return 'pablo'
endfunction
" vim:ft=vim:ts=2:sw=2
