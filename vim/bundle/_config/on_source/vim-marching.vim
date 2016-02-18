let g:clang_complete_auto       = 0
let g:clang_auto_select         = 0
let g:clang_default_keymappings = 0
let g:clang_use_library         = 1

let g:marching_clang_command = "clang"

let g:marching#clang_command#options = {
      \   "c"   : "-std=c1y",
      \   "cpp" : "-std=c++1y -stdlib=libc++ --pedantic-errors"
      \}

let g:marching_include_paths = [
      \ '/usr/include',
      \ '/usr/local/include',
      \ '.',
      \ './src'
      \]

let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

set updatetime=200
