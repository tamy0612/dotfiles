"==========================================================
" vim/ftdetect/filetype.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 12 Jan. 2018.
"==========================================================

augroup MyFiletype
    autocmd!
    autocmd BufNewFile,BufRead *.tikz :set ft=tex
    autocmd BufNewFile,BufRead vim/template/* :set ft=conf
augroup END
