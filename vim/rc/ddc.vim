"==========================================================
" vim/rc/ddc.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" License: MIT License
"==========================================================

call ddc#custom#patch_global('sources', ['around', 'file', 'nextword'])

call ddc#custom#patch_global('sourceOptions', {
      \  'around': {'mark': 'A'},
      \  'file': {'mark': 'file'},
      \  'nextword': {'mark': 'next'},
      \   '_' : {
      \     'matchers': ['matcher_head'],
      \     'sorters': ['sorter_rank'],
      \   },
      \ })

inoremap <silent><expr> <TAB> ddc#map#pum_visible() ? '<C-n>' : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? '<TAB>' : ddc#manual_complete()
inoremap <expr> <S-TAB> ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

call ddc#enable()

" vim:ft=vim:ts=2:sw=2:fdm=marker
