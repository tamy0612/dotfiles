" Vim color file
" Maintainer: tamy0612 <tamy@tamydom.net>
" Last Change: 06-Sep-2013.
" Version: 1.0
"
" GUI / 256 color terminal

highlight clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "coding"

set t_Co=256


if &background == 'dark'

  " Base color
  " ----------
  highlight Normal ctermfg=252 ctermbg=0
  highlight Normal guifg=#d0d0d0 guibg=#000000

  " Comment Group
  " -------------
  highlight Comment ctermfg=245 cterm=none
  highlight Comment guifg=#8a8a8a gui=none

  " Constant Group
  " --------------
  highlight Constant ctermfg=13 cterm=none
  highlight Constant guifg=#ff00ff gui=none

  " Identifier Group
  " ----------------
  highlight Identifier ctermfg=51 cterm=bold
  highlight Identifier guifg=#00ffff gui=bold

  " PreProc Group
  " -------------
  highlight PreProc ctermfg=81 cterm=none
  highlight PreProc guifg=#5fd7ff gui=none

  " Type Group
  " ----------

  " Special Group
  " -------------
  highlight Special ctermfg=Brown cterm=none
  highlight Special guifg=#ffafaf gui=none

  " Emphasis
  " --------
  highlight Error ctermfg=15 ctermbg=1 cterm=bold
  highlight Error guifg=#ffffff guibg=#800000 gui=bold
  highlight Search ctermfg=15 ctermbg=1
  highlight Search guifg=#ffffff guibg=#800000
  highlight Todo  ctermfg=1 ctermbg=3
  highlight Todo  guifg=#800000 guibg=#808000

  " Visual
  " ------
  highlight Visual ctermbg=236
  highlight Visual guibg=#303030

  " Corsor
  " ------
  set cursorline
  if v:version < 704
    highlight clear cursorcolumn
  endif
  highlight CursorLine cterm=underline ctermbg=236
  highlight CursorLine gui=underline guibg=#303030
  highlight LineNr ctermfg=darkgray
  highlight LineNr guifg=#555555
  highlight CursorLineNr ctermfg=red
  highlight CursorLineNr guifg=#dd2222
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

else

  " Base color
  " ----------
  highlight Normal ctermfg=0 ctermbg=252
  highlight Normal guifg=#000000 guibg=#d0d0d0

  " Comment Group
  " -------------
  highlight Comment ctermfg=245 cterm=none
  highlight Comment guifg=#8a8a8a gui=none

  " Constant Group
  " --------------
  highlight Constant ctermfg=13 cterm=none
  highlight Constant guifg=#ff00ff gui=none

  " Identifier Group
  " ----------------
  highlight Identifier ctermfg=51 cterm=bold
  highlight Identifier guifg=#00ffff gui=bold

  " PreProc Group
  " -------------
  highlight PreProc ctermfg=81 cterm=none
  highlight PreProc guifg=#5fd7ff gui=none

  " Type Group
  " ----------

  " Special Group
  " -------------
  highlight Special ctermfg=Brown cterm=none
  highlight Special guifg=#ffafaf gui=none

  " Emphasis
  " --------
  highlight Error ctermfg=15 ctermbg=1 cterm=bold
  highlight Error guifg=#ffffff guibg=#800000 gui=bold
  highlight Search ctermfg=15 ctermbg=1
  highlight Search guifg=#ffffff guibg=#800000
  highlight Todo  ctermfg=1 ctermbg=3
  highlight Todo  guifg=#800000 guibg=#808000

  " Visual
  " ------
  highlight Visual ctermbg=236
  highlight Visual guibg=#303030

  " Corsor
  " ------
  set cursorline
  if v:version < 704
    highlight clear cursorcolumn
  endif
  highlight CursorLine cterm=underline ctermbg=236
  highlight CursorLine gui=underline guibg=#303030
  highlight LineNr ctermfg=darkgray
  highlight LineNr guifg=#555555
  highlight CursorLineNr ctermfg=red
  highlight CursorLineNr guifg=#dd2222
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

endif
