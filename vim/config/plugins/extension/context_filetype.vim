" Toml config
let g:context_filetype#filetypes.toml = [
      \   { 'filetype': 'vim',
      \     'start': '^\s*hook_\(add\|source\|post_source\)\s*=\s*'."'"."''",
      \     'end': "'"."''"
      \   },
      \   { 'filetype': 'vim',
      \     'start': '^\s*hook_\(add\|source\|post_source\)\s*=\s*'.'"""',
      \     'end': '"""'
      \   }
      \ ]
