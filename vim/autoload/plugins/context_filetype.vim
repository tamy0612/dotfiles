"==========================================================
" vim/autoload/plugins/context_filetype.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 11 Dec. 2018.
"==========================================================
function! plugins#context_filetype#register() abort
  let g:context_filetype#filetypes = get(g:, 'context_filetype#filetypes', {})
  let g:context_filetype#filetypes.toml = s:toml()
endfunction

function! s:toml() abort
  return [
      \   {
      \     'filetype': 'vim',
      \     'start': '^\s*hook_\(add\|source\|post_source\)\s*=\s*'."'"."'''",
      \     'end': "'"."'''"
      \   },
      \   {
      \     'filetype': 'vim',
      \     'start': '^\s*hook_\(add\|source\|post_source\)\s*=\s*'.'"""',
      \     'end': '"""'
      \   }
      \ ]
endfunction
" vim:ft=vim:ts=2:sw=2:fdm=marker
