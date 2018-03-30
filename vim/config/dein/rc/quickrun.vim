"==========================================================
" vim/config/dein/rc/quickrun.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 02 Apr. 2018.
"==========================================================
" global setting
let g:quickrun_config._ = {
      \ 'runner' : 'vimproc',
      \ 'hook/time/enable' : 1,
      \ 'outputter/buffer/split' : 'botright 15sp',
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
