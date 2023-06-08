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

call ddc#custom#patch_global('sources', ['vim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
        \   'vim-lsp': {'mark': 'LSP', 'matchers': ['matcher_head']},
        \   'around': {'mark': 'A'}
        \ })

inoremap <silent><expr> <Tab> pum#visible() ?
        \ '<Cmd>call pum#map#insert_relative(+1)<CR>' :
        \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
        \   '<Tab>' : ddc#map#manual_complete()
inoremap <expr> <S-Tab> pum#isible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' : '<C-h>'

inoremap <C-n> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-e> <Cmd>call pum#map#cancel()<CR>

setglobal completeopt=menu,menuone,preview,noselect
