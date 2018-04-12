"==========================================================
" vim/config/dein/rc/quickrun.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 10 Apr. 2018.
"==========================================================
" global setting
let g:quickrun_config._ = {
      \ 'runner': vimrc#is_nvim() ? 'nvim_job' : 'job',
      \ 'outputter': 'multi:buffer:quickfix',
      \ 'outputter/buffer/split': 'botright 15sp',
      \ 'hook/close_quickfix/enable_success': 1,
      \ 'hook_close_quickfix/enable_hook_loaded': 1,
      \ 'hook/time': 1
      \}

" for Rust
let g:quickrun_config.rust = {
      \ 'outputter/': 'multi:buffer:quickfix',
      \ 'outputter/buffer/split': 'botright 15sp',
      \ 'command': filereadable(expand('./Cargo.toml')) ? 'cargo build' : 'rustc'
      \}

" for D-lang
let g:quickrun_config['d/run'] = {
      \ 'type' : 'd/run',
      \ 'command' : 'dmd',
      \ 'exec' : '%c -run %s',
      \}
let g:quickrun_config['d/test'] = {
      \ 'type' : 'd/test',
      \ 'command' : 'dmd',
      \ 'exec' : '%c -main -unittest %s',
      \}

" for rspec
let g:quickrun_config['rspec/bundle'] = {
      \ 'type' : 'rspec/bundle',
      \ 'command' : 'rspec',
      \ 'exec' : 'bundle exec %c %s',
      \}
let g:quickrun_config['rspec/normal'] = {
      \ 'type' : 'rspec/normal',
      \ 'command' : 'rspec',
      \ 'exec' : '%c %s',
      \}
" vim:ft=vim:ts=2:sw=2:fdm=marker
