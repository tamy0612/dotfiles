"==========================================================
" vim/autoload/vimrc/template/cpp.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 18 Mar. 2020.
"==========================================================

let g:vimrc#template#cpp#ignore_dirs = ['src', 'include']

function! s:trim(path) abort
  let l:paths = split(a:path, '/')
  for l:dir in g:vimrc#template#cpp#ignore_dirs
    let l:index = index(l:paths, l:dir)
    if l:index >= 0
      call remove(l:paths, l:index)
    endif
  endfor
  return join(l:paths, '/')
endfunction

function! s:append_prefix_if_exists(path) abort
  if !exists('g:cpp_project_prefix')
    return a:path
  endif
  return g:cpp_project_prefix . '/' . a:path
endfunction


function! vimrc#template#cpp#filename() abort
  return s:trim(vimrc#relative_filepath())
endfunction

function! vimrc#template#cpp#guard_macro() abort
  let l:base = s:append_prefix_if_exists(vimrc#template#cpp#filename())
  return substitute(substitute(toupper(l:base), '/', '_', 'g'), '\.', '_', 'g')
endfunction

function! vimrc#template#cpp#namespace() abort
  let l:base = s:append_prefix_if_exists(s:trim(expand('%:h')))
  return substitute(substitute(l:base, '/', '::', 'g'), '\.', '', 'g')
endfunction

" vim:ft=vim:ts=2:sw=2:fdm=marker
