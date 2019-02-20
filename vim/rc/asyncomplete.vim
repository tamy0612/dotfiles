"==========================================================
" vim/rc/asyncomplete.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 27 Feb. 2019.
"==========================================================
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_remove_duplicate = 1
let g:asyncomplete_smart_completion = vimrc#is_nvim() || has("lua")
let g:asyncomplete_log_file = expand("$VIM_CACHE_DIR/asyncomplete.log")

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<Space>" : "\<CR>"
imap <C-x><C-u> <Plug>(asyncomplete_force_refresh)

setglobal completeopt=menu,preview,noinsert,noselect
autocmd MyCmdGroup CompleteDone * if pumvisible() == 0 | pclose |endif
" vim:ft=vim:ts=2:sw=2:fdm=marker
