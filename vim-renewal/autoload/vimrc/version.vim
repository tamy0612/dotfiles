function! vimrc#version#is_nvim() abort
  return has('nvim')
endfunction

function! vimrc#version#is_gvim() abort
  return has('gui_running')
endfunction

function! vimrc#version#major() abort
  let s:version_major = get(s:, 'version_major', v:version / 100)
  return s:version_major
endfunction

function! vimrc#version#minor() abort
  let s:version_minor = get(s:, 'version_minor', v:version % 100)
  return s:version_minor
endfunction

function! vimrc#version#full() abort
  return v:version
endfunction

function! vimrc#version#check(major, minor) abort
  return a:major <= vimrc#version#major() && a:minor <= vimrc#version#minor()
endfunction

function! vimrc#version#is_patched(patch) abort
  return has('patch' . a:patch)
endfunction
" vim:ft=vim:ts=2:sw=2
