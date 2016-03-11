"" Plugin dir
let s:plugin_dir = expand('$CACHE_DIR/vim/plugins')
if !isdirectory(s:plugin_dir)
  echo "Creating plugin dir..."
  call mkdir(s:plugin_dir, 'p')
endif

"" Load plugin manager
let s:plugin_manager = 'dein.vim'

if &runtimepath !~ '/'.s:plugin_manager

  let s:plugin_manager_dir = s:plugin_dir . '/' . s:plugin_manager

  if !isdirectory( s:plugin_manager_dir )
    if executable('git')
      echo "Downloading plugin manager..."
      execute '!git clone https://github.com/Shougo/'.s:plugin_manager s:plugin_manager_name
    else
      echo "command 'git' required"
      finish
    endif
  endif

  execute 'set runtimepath^=' . fnamemodify(s:plugin_manager_dir, ':p')

endif

if dein#load_state(expand(s:plugin_dir))

  call dein#begin(expand(s:plugin_dir))

  let s:toml_path = expand('$VIMDIR/config/plugins.default.toml')
  let s:toml_lazy_path = expand('$VIMDIR/config/plugins.lazy.toml')

  if dein#load_cache([expand('<sfile>'), s:toml_path, s:toml_lazy_path])
    call dein#add('Shougo/dein.vim', {'rtp': ''})
    call dein#load_toml(s:toml_path, {'lazy': 0 })
    call dein#load_toml(s:toml_lazy_path, {'lazy': 1})
    call dein#save_cache()
  endif

  call dein#end()

endif
