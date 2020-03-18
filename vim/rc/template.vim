"==========================================================
" vim/rc/template.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 18 Mar. 2020.
"==========================================================
function! s:load_skeleton(name) abort
  execute 'TemplateLoad /skeleton/' . a:name
endfunction

function! s:move_cursor_if_exists(tag) abort
  if search('<+' . a:tag . '+>')
    execute 'normal! "_da>'
  endif
endfunction

augroup MyTemplates
  autocmd!
  autocmd BufNewFile *.h,*.hpp  call s:load_skeleton('cpp')
  autocmd BufNewFile *.vim      call s:load_skeleton('vim')
  autocmd BufNewFile *.tikz     call s:load_skeleton('tikz')
augroup END

autocmd User plugin-template-loaded call s:move_cursor_if_exists('CURSOR')
" vim:ft=vim:ts=2:sw=2:fdm=marker
