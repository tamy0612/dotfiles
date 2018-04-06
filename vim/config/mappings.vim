"==========================================================
" vim/config/mappings.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 06 Apr. 2018.
"==========================================================
" cursor
imap OA <UP>
imap OB <Down>
imap OC <Right>
imap OD <Left>
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" mode change
imap <C-@> <C-[>

" window
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" edit
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" highlight
nmap <silent> <Esc><Esc> :<C-u>nohlsearch<CR><Esc>
nmap # "zyiw:let @/ = '\<' . @z . '\>'<CR>:%s/<C-r>///gc<Left><Left><Left>

" quick help
nnoremap <expr> K (&filetype is# 'vim' ? (':help ' . fnameescape(expand('<cword>')) . '<CR>') : 'K')

map <C-c> g<C-g>
tnoremap <ESC> <C-\><C-n>

autocmd FileType help,diff nnoremap <silent><buffer> q :<C-u>q<CR>

" misc.
nnoremap <silent> <Leader>n :<C-u>call vimrc#toggle_variable("&relativenumber")<CR>
" vim:ft=vim:ts=2:sw=2:fdm=marker
