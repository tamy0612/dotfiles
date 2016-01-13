let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = $VIMDIR.'/snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
imap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
