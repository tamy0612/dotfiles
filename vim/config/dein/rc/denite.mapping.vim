"==========================================================
" vim/config/dein/rc/denite.mapping.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 02 Apr. 2018.
"==========================================================
" Shortcut
nnoremap <silent> / :<C-u>Denite line<CR>

" Denite mapping
nnoremap [denite] <Nop>
nmap <Leader>d [denite]

nmap <silent> [denite]b :<C-u>Denite buffer<CR>
nmap <silent> [denite]j :<C-u>Denite -auto-preview -vertical-preview jump<CR>
nmap <silent> [denite]g :<C-u>Denite -auto-preview -vertical-preview grep<CR>
nmap <silent> [denite]o :<C-u>Denite -auto-preview -vertical-preview outline tag<CR>
nmap <silent> [denite]l :<C-u>Denite -auto-preview -vertical-preview location_list quickfix<CR>
nmap <silent> [denite]f :<C-u>Denite `finddir('.git', ';') != '' ? 'file_rec/git' : ''` file_rec file_mru file_old<CR>
nmap <silent> [denite]d :<C-u>Denite directory_rec<CR>
nmap <silent> [denite]c :<C-u>Denite command_history command<CR>
nmap <silent> [denite]y :<C-u>Denite register neoyank<CR>
xmap <silent> [denite]y :<C-u>Denite -default-action=replace register neoyunk<CR>
nmap <silent> [denite]m :<C-u>Denite menu<CR>
nmap <silent> [denite]h :<C-u>Denite help<CR>

nmap <silent> [denite]. :<C-u>Denite -resume<CR>
nmap <silent> [denite]n :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
nmap <silent> [denite]p :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>
" vim:ft=vim:ts=2:sw=2:fdm=marker
