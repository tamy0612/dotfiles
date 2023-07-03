"==========================================================
" vim/autoload/vimrc/denops.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" License: MIT License
"==========================================================

let s:denops_enabled = v:false

function vimrc#denops#enable()
  let s:denops_enabled = executable("deno") && v:true
endfunction

function vimrc#denops#disable()
  let s:denops_enabled = v:false
endfunction

function vimrc#denops#is_available()
  return s:denops_enabled
endfunction

" vim:ft=vim:ts=2:sw=2:fdm=marker
