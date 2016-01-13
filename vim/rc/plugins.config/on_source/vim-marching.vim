" clang コマンドの設定
let g:marching_clang_command = "clang"

" オプションを追加する
" filetype=cpp に対して設定する場合
let g:marching#clang_command#options = {
      \   "c"   : "-std=c11",
      \   "cpp" : "-std=c++11 -stdlib=libc++ --pedantic-errors"
      \}

" インクルードディレクトリのパスを設定
let g:marching_include_paths = [
      \ '/usr/include',
      \ '/usr/local/include',
      \ '.',
      \ './src'
      \]

" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" 処理のタイミングを制御する
" 短いほうがより早く補完ウィンドウが表示される
" ただし、marching.vim 以外の処理にも影響するので注意する
set updatetime=200
