let g:gitgutter_async   = 1
let g:gitgutter_highlight_lines = 0

let g:gitgutter_sign_added    = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed  = '-'
let g:gitgutter_sign_modified_removed = '*'

noremap [git] <Nop>
map <C-g> [git]
nmap <silent> [git]h :GitGutterLineHighlightsToggle<CR>
nmap <silent> [git]n :GitGutterNextHunk<CR>
nmap <silent> [git]p :GitGutterPrevHunk<CR>

autocmd! FileType gina-commit execute "normal! G"

for kind in ['log', 'status', 'diff']
    call gina#custom#command#option(kind, '--opener', 'split')
    execute 'autocmd' 'vimrc Filetype gine-' . kind . ' nnoremap q :q<CR>'
endfor
