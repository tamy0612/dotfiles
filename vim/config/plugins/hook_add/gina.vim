nnoremap [git] <Nop>
nmap <Leader>g [git]
nmap <silent> [git]s :<C-u>Gina status<CR>
nmap <silent> [git]b :<C-u>Gina branch<CR>
nmap <silent> [git]c :<C-u>Gina commit<CR>
nmap <silent> [git]d :<C-u>Gina diff<CR>

if dein#tap('vim-gitgutter')
    nmap <silent> [git]p :<C-u>GitGutterPrevHunk<CR>
    nmap <silent> [git]n :<C-u>GitGutterNextHunk<CR>
    nmap <silent> [git]v :<C-u>GitGutterPreviewHunk<CR>
    nmap <silent> [git]t :<C-u>GitGutterToggle<CR>
endif
