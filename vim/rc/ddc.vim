"==========================================================
" vim/rc/ddc.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" License: MIT License
"==========================================================

setlocal dictionary+=/usr/share/dict/words

call ddc#custom#patch_global('sources', ['buffer', 'file', 'dictionary'])

call ddc#custom#patch_global('sourceOptions', {
      \   '_' : {
      \     'matchers': ['matcher_fuzzy'],
      \     'sorters': ['sorter_rank'],
      \   },
      \  'buffer': {'mark': 'B'},
      \  'file': {'mark': 'F'},
      \  'dictionary': {'mark': 'D'},
      \ })

call ddc#custom#patch_global('sourceParams', {
      \  'vim-lsp': {'ignoreCompleteProvider': v:true},
      \  'buffer': {'requireSameFiletype': v:false, 'limitBytes': 500000, 'fromAltBuf': v:true, 'forceCollect': v:true},
      \  'dictionary': {'dictPaths': [&dictionary]},
      \ })

call ddc#custom#patch_global('filterParams', {
      \  'matcher_fuzzy': {'camelcase': v:true},
      \ })

call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['vim-lsp', 'buffer', 'file'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {'vim-lsp': {'mark': 'lsp', 'matcher': 'matcher_head'}})

inoremap <silent><expr> <TAB> ddc#map#pum_visible() ? '<C-n>' : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? '<TAB>' : ddc#manual_complete()
inoremap <expr> <S-TAB> ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

call ddc#enable()

" vim:ft=vim:ts=2:sw=2:fdm=marker
