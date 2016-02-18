" Vim color file
" Maintainer: tamy0612 <tamy@tamydom.net>
" Last Change: 12-Jun-2014.
" Version: 1.0
"
" GUI / 256 color terminal

highlight clear
let colors_name = expand('<sfile>:t:r')
set t_Co=256
set background=dark

" Base color
" ----------
highlight Normal ctermfg=252 ctermbg=none guifg=#d0d0d0 guibg=#000000

" Comment Group
" -------------
highlight Comment ctermfg=243 cterm=none guifg=#6f6f6f gui=none

" Constant Group
" --------------
highlight Constant ctermfg=199 cterm=none guifg=#ff69b4 gui=none

" Identifier Group
" ----------------
highlight Identifier ctermfg=51 cterm=bold guifg=#00f5ff gui=bold

" Statement Group
" ----------------
highlight Statement ctermfg=11 cterm=none guifg=#ffff00 gui=none
highlight Conditional ctermfg=11 cterm=bold guifg=#ffff00 gui=bold
highlight Repeat ctermfg=11 cterm=bold guifg=#ffff00 gui=bold
highlight Exception ctermfg=11 cterm=bold guifg=#ffff00 gui=bold

" PreProc Group
" -------------
highlight PreProc ctermfg=39 cterm=none guifg=#00bfff gui=none

" Type Group
" ----------
highlight Type ctermfg=120 cterm=none guifg=#98fb98 gui=none

" Special Group
" -------------
highlight Special ctermfg=196 cterm=none guifg=#ee0000 gui=none

" Emphasis
" --------
highlight Underlined ctermfg=121 cterm=underline guifg=#76eec6 gui=underline
highlight Error ctermfg=15 ctermbg=88 cterm=bold guifg=#ffffff guibg=#800000 gui=bold
highlight Search ctermfg=15 ctermbg=88 guifg=#ffffff guibg=#800000
highlight Todo  ctermfg=124 ctermbg=184 cterm=bold guifg=#aa0000 guibg=#dddd00 gui=bold

" Visual
" ------
highlight Visual ctermbg=237 guibg=#282828

" Corsor
" ------
set cursorline
if v:version < 704
  highlight clear cursorcolumn
endif
highlight CursorLine ctermbg=235 cterm=underline guibg=#202020 gui=underline
highlight LineNr ctermfg=238 ctermbg=none  guifg=#404040 guibg=#000000
highlight CursorLineNr ctermfg=203 ctermbg=235 guifg=#ff3030 guibg=#202020
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
  if v:version < 704
    autocmd WinLeave * set nocursorcolumn
    autocmd WinEnter,BufRead * set cursorcolumn
  endif
augroup END

" Status line
" -----------
augroup sl
  autocmd! sl
  autocmd VimEnter * hi StatusLine ctermfg=LightGray ctermbg=DarkBlue cterm=none
  autocmd InsertEnter * hi StatusLine ctermfg=White ctermbg=DarkRed cterm=none
  autocmd InsertLeave * hi StatusLine ctermfg=LightGray ctermbg=DarkBlue cterm=none
augroup END
