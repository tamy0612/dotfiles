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
nnoremap <C-S-h> <C-w>h
nnoremap <C-S-Left> <C-w><Left>
nnoremap <C-S-j> <C-w>j
nnoremap <C-S-Down> <C-w><Down>
nnoremap <C-S-k> <C-w>k
nnoremap <C-S-Up> <C-w><Up>
nnoremap <C-S-l> <C-w>l
nnoremap <C-S-Right> <C-w><Right>

" indent
xnoremap <TAB>  >
xnoremap <S-TAB>  <
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv
nnoremap <silent> <Leader>= :<C-u>execute "normal!gg=G"<CR>

" edit
nnoremap <Leader>e :<C-u>e
nnoremap <Leader>en :<C-u>enew<CR>
nnoremap <Leader>es :<C-u>Scratch<CR>
nmap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>

" quick help
nnoremap <C-h> :<C-u>help<Space><C-r><C-w><CR>
