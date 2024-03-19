call ddc#custom#patch_global('ui', 'pum')

call ddc#custom#patch_global('sourceOptions', {
        \   '_': {
        \       'matchers': ['matcher_fuzzy'],
        \       'sorters': ['sorter_fuzzy'],
        \       'converters': ['converter_fuzzy', 'converter_remove_overlap'],
        \   }
        \ })
call ddc#custom#patch_global('filterParams', {
        \   'matcher_fuzzy': {'splitMode': 'word'},
        \   'converter_fuzzy': {'hlGroup': 'SpellBad'},
        \})

call ddc#custom#patch_global('sources', ['vim-lsp', 'skkeleton', 'around', 'path'])
call ddc#custom#patch_global('sourceOptions', {
      \   'vim-lsp': {'mark': 'LSP', 'matchers': ['matcher_head']},
      \   'skkeleton': {'mark': 'skk', 'matchers': ['skkeleton']},
      \   'around': {'mark': 'A'},
      \   'path': {'mark': 'P'}
      \ })

call ddc#custom#patch_global('sourceParams', {
      \   'path': {
      \     'cmd': ['fd', '--max-depth', '5'],
      \   }
      \ })

inoremap <silent><expr> <Tab>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>'
      \               : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? '<Tab>' : ddc#map#manual_complete()
inoremap <expr> <S-Tab> pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' : '<C-h>'

inoremap <C-n> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-e> <Cmd>call pum#map#cancel()<CR>

setglobal completeopt=menu,menuone,preview,noselect

let s:skk_dir = expand(exists('$XDG_DATA_HOME') ? '$XDG_DATA_HOME/skk' : '~/.local/share/skk')
let s:skk_jisyo = expand(join([s:skk_dir, "SKK-JISYO.L"], '/'))
if filereadable(s:skk_jisyo)
  call skkeleton#config({'globalDictionaries': [s:skk_jisyo]})
  call skkeleton#config({'completionRankFile': expand(join([s:skk_dir, 'rank.json'], '/'))})
  inoremap <C-j> <Plug>(skkeleton-toggle)
  cnoremap <C-j> <Plug>(skkeleton-toggle)
else
  call vimrc#log#error("SKK dictionary is not found.")
endif
" vim:ft=vim:ts=2:sw=2:fdm=marker
