"==========================================================
" vim/rc/content_filetype.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 20 Feb. 2019.
"==========================================================
let g:context_filetype#filetypes = get(g:, 'context_filetype#filetypes', {})

" Toml
let g:context_filetype#filetypes.toml = [
    \   {
    \     'filetype': 'vim',
    \     'start': '^\s*hook_\(add\|source\|post_source\)\s*=\s*'."'"."''",
    \     'end': "'"."''"
    \   },
    \   {
    \     'filetype': 'vim',
    \     'start': '^\s*hook_\(add\|source\|post_source\)\s*=\s*'.'"""',
    \     'end': '"""'
    \   }
    \ ]
" vim:ft=vim:ts=2:sw=2:fdm=marker
