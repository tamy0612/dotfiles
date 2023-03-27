"==========================================================
" vim/autoload/vimrc/deno.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" License: MIT License
"==========================================================

let s:deno_enabled = v:false

function vimrc#deno#enable()
  let s:deno_enabled = v:true
endfunction

function vimrc#deno#disable()
  let s:deno_enabled = v:false
endfunction

function vimrc#deno#is_available()
  return s:deno_enabled
endfunction

" vim:ft=vim:ts=2:sw=2:fdm=marker
