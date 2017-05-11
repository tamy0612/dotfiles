let g:gitgutter_async   = 1
let g:gitgutter_enabled = 1
let g:gitgutter_sign_added    = '+'
let g:gitgutter_sign_modified = '!'
let g:gitgutter_sign_removed  = '-'
let g:gitgutter_sign_modified_removed = '!-'

nnoremap [git] <Nop>
nmap <C-g> [git]
nmap <silent>  [git]g :<C-u>GitGutterToggle<CR>
nmap <silent>  [git]n :<C-u>GitGutterNextHunk<CR>
nmap <silent>  [git]p :<C-u>GitGutterPrevHunk<CR>
nmap <silent>  [git]a :<C-u>GitGutterStageHunk<CR>
nmap <silent>  [git]r :<C-u>GitGutterUndoHunk<CR>
nmap <silent>  [git]v :<C-u>GitGutterPreviewHunk<CR>
