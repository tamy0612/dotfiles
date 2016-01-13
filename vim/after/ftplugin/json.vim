if exists( 'b:did_json_ftplugin' )
  finish
endif
let b:did_json_ftplugin = 1

if executable('jq')
  command! -nargs=? Jq call commands#json#jq(<f-args>)
  nnoremap <buffer> <silent> <Leader>= :<C-u>Jq<CR>
endif
