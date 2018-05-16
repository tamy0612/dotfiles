"==========================================================
" vim/config/dein/rc/lightline.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 16 May. 2018.
"==========================================================
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], ['filestatus', 'filename']],
      \   'right': [['lineinfo'], ['gitinfo', 'gitstatus'], ['lint']]
      \ },
      \ 'inactive': {
      \   'left': [['filestatus', 'filename']],
      \   'right': [['gitinfo', 'gitstatus']]
      \ },
      \ 'component_function': {
      \   'mode': 'vimrc#lightline#mode',
      \   'paste': 'vimrc#lightline#paste',
      \   'filestatus': 'vimrc#lightline#file_status',
      \   'filename': 'vimrc#lightline#filename',
      \   'lint': 'vimrc#lightline#lint_info',
      \   'gitinfo': 'vimrc#lightline#git_branch',
      \   'gitstatus': 'vimrc#lightline#git_status',
      \   'lineinfo': 'vimrc#lightline#line'
      \ }
      \}
" vim:ft=vim:ts=2:sw=2:fdm=marker
