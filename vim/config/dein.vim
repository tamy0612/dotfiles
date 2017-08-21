"" Plugin dir
let s:plugin_dir = expand('$VIM_CACHE_DIR/plugins')
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
      execute '!git clone https://github.com/Shougo/'.s:plugin_manager s:plugin_manager_dir
    else
      echo "command 'git' required"
      finish
    endif
  endif

  execute 'set runtimepath^=' . fnamemodify(s:plugin_manager_dir, ':p')

endif

if !dein#load_state(s:plugin_dir)
  finish
endif

let s:toml_dir = '$VIMDIR/config/plugins/'
let s:toml_path = expand(s:toml_dir . 'default.toml')
let s:toml_lazy_path = expand(s:toml_dir . 'lazy.toml')
let s:toml_nyaovim_path = expand(s:toml_dir . 'nyaovim.toml')

call dein#begin(s:plugin_dir)

call dein#load_toml(s:toml_path, {'lazy': 0 })
call dein#load_toml(s:toml_lazy_path, {'lazy': 1})
if exists('g:nyaovim_version')
    call dein#load_toml(s:toml_nyaovim_path, {'lazy': 1})
endif

call dein#end()
call dein#save_state()
