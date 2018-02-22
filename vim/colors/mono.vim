"==========================================================
" mono.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 22-Feb-2018.
"==========================================================
hi clear
set background=dark
set t_Co=256
if exists('g:color_name')
    let g:color_name = 'mono'
endif

hi Normal  ctermfg=250 ctermbg=235
hi Comment ctermfg=240
hi Statement ctermfg=245
hi Identifier ctermfg=252 cterm=bold
hi Constant ctermfg=244
hi PreProc  ctermfg=245
hi Type ctermfg=252
hi Special ctermfg=244
hi Title ctermfg=252 cterm=underline

hi Visual ctermbg=0
hi Conceal ctermfg=240 ctermbg=none

hi LineNr  ctermfg=240
hi CursorLine ctermbg=0 cterm=none
hi CursorLineNr ctermfg=245 ctermbg=0 cterm=bold
hi ColorColumn ctermbg=240
