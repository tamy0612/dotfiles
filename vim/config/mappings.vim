"
let mapleader = "\<Space>"

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
map ; :

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
