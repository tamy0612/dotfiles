nnoremap [unite] <Nop>
nmap <Leader>u [unite]
nmap <silent>  [unite]f :<C-u>Unite -vertical -winwidth=30 file<CR>
nmap <silent>  [unite]b :<C-u>Unite -winheight=10 buffer<CR>
nmap <silent>  [unite]r :<C-u>Unite -winheight=10 -buffer-name=register register<CR>
nmap <silent>  [unite]o :<C-u>Unite -vertical -winwidth=30 -no-quit outline<CR>
nmap <silent>  [unite]t :<C-u>Unite -winheight=10 tab<CR>
nmap <silent>  [unite]w :<C-u>Unite -winheight=10 window<CR>
nmap <silent>  [unite]m :<C-u>Unite -winheight=15 mapping<CR>
nmap <silent>  [unite]s :<C-u>Unite -winheight=10 menu:shortcut<CR>
nmap <silent>  [unite]c :<C-u>Unite -vertical -winwidth=30 bookmark<CR>
nmap <silent>  [unite]a :<C-u>UniteBookmarkAdd<CR>
