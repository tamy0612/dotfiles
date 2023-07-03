augroup Precious
  autocmd!
  autocmd FileType toml :PreciousSwitch
augroup END

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
