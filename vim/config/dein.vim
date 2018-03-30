"==========================================================
" vim/config/dein.vim
"
" Author: Yasumasa TAMURA (tamura.yasumasa@gmail.com)
" Last Change: 02 Apr. 2018.
"==========================================================
let s:dein_cache_dir = expand($VIM_CACHE_DIR . '/dein')
call vimrc#mkdir_unless_exist(s:dein_cache_dir)

let g:dein#install_progress_type = 'title'
let g:dein#enable_notifycation = 1
let g:dein#install_log_filename = expand('')

if has('vim_starting') && &runtimepath !~ '/dein.vim'
  let s:dein_dir = expand(s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim')
  if !isdirectory(s:dein_dir)
    if executable('git')
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    else
      echomsg '[Error] git command not found, skip installing dein.vim'
      finish
    endif
  endif
  execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p'), '/$', '', '')
endif

if &runtimepath !~ '/dein.vim'
  echomsg '[Error] dein.vim is not loaded'
  finish
endif

set packpath=

if !dein#load_state(s:dein_cache_dir)
  finish
endif

let s:dein_config_dir = expand($VIMDIR . '/config/dein')
let s:dein_config_files = [
      \ {'file': 'fundamental.toml', 'option': {'lazy': 0}},
      \ {'file': 'command.toml', 'option': {'lazy': 1}},
      \ {'file': 'operator.toml', 'option': {'lazy': 1}},
      \ {'file': 'devtools.toml', 'option': {'lazy': 1}},
      \ {'file': 'filetypes.toml', 'option': {'lazy': 1}},
      \ {'file': 'completion.toml', 'option': {'lazy': 1}},
      \ {'file': 'vim8.toml', 'option': {'lazy': 1, 'if': 'vimrc#is_vim8()'}}
      \]

let s:dein_dependencies = [$VIMDIR . '/init.vim']
let s:dein_dependencies += split(glob($VIMDIR . '/config/*.vim'), '\n')
let s:dein_dependencies += map(copy(s:dein_config_files), 'v:val.file')

call dein#begin(s:dein_cache_dir, s:dein_dependencies)
for config in s:dein_config_files
  call dein#load_toml(join([s:dein_config_dir, config.file], '/'), config.option)
endfor

call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" vim:ft=vim:ts=2:sw=2:fdm=marker
