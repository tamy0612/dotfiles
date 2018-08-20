"==========================================================
" vim/config/dein/rc/deoplete.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 04 Aug. 2018.
"==========================================================
" Config
set completeopt=menuone,noselect,longest,preview
autocmd MyCmdGroup CompleteDone * pclose!

let g:deoplete#enable_at_startup            = 1
let g:deoplete#enable_ignore_case           = 1
let g:deoplete#enable_smart_case            = 1
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#enable_reflesh_always        = 1
let g:deoplete#enable_camel_case            = 1
let g:deoplete#text_mode_filetypes          = {'_': 1}
let g:deoplete#auto_complete_delay          = 0

if !exists('g:deoplete#omni_patterns')
    let g:deoplete#omni_patterns = {}
endif
let g:deoplete#omni_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
let g:deoplete#omni_patterns.c    = '[^.[:digit:]*\t]\%(\.\|->\)'
let g:deoplete#omni_patterns.cpp  = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'

" Mapping
function! s:check_back_space() abort
    let l:col = col('.') - 1
    return !l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <TAB>
"             \ pumvisible() ? "\<C-n>" :
"             \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
"             \ <SID>check_back_space() ? "\<TAB>" :
"             \ deoplete#mappings#manual_complete()
" inoremap <silent><expr> <S-TAB>
"             \ pumvisible() ? "\<C-p>" :
"             \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-h>"

" inoremap <expr><Space>  pumvisible() ? deoplete#mappings#close_popup()."\<Space>" : "\<Space>"
" inoremap <expr><BS>     deoplete#mappings#smart_close_popup()."\<BS>"

" inoremap <expr><C-g> deoplete#mappings#undo_completion()
" inoremap <expr><C-l> deoplete#mappings#refresh()
inoremap <silent><expr> <TAB>     pumvisible() ? "\<C-n>"
      \                                        : <SID>check_back_space() ? "\<TAB>"
      \                                                                  : deoplete#manual_complete()
inoremap <expr>         <S-TAB>   pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr>         <BS>      deoplete#smart_close_popup()."\<C-h>"
inoremap <expr>         <C-h>     deoplete#smart_close_popup()."\<C-h>"

command! DeopleteDisabled let b:deoplete_disable_auto_complete = 1

" inoremap <silent><expr> <CR>      <C-r>=deoplete#cancel_popup() . "\<CR>"
" vim:ft=vim:ts=2:sw=2:fdm=marker
