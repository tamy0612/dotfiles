"" message lang
if IsWindows()
  language message en
else
  language message C
endif

"" Runtime path
if IsWindows()
  set runtimepath^=$VIMDIR
  set runtimepath+=$VIMDIR/after
endif

"" Shell
set shell=zsh
if IsWindows()
  set shellslash
endif

"" Cache
if !exists('$VIM_CACHE_DIR')
  if exists('$XDG_CACHE_HOME')
    let $VIM_CACHE_DIR = expand("$XDG_CACHE_HOME/vim")
  else
    let $VIM_CACHE_DIR = expand('$HOME/.cache/vim')
  endif
endif
if !isdirectory(expand($VIM_CACHE_DIR))
  echo "Creating cache dir '" . expand("$VIM_CACHE_DIR") . "'"
  call mkdir(expand($VIM_CACHE_DIR), 'p')
endif

"" Backup
set backupdir=$VIM_CACHE_DIR/back
if !isdirectory(expand(&backupdir))
  echo "Creating backup dir '" . expand(&backupdir) . "'"
  call mkdir(expand(&backupdir), 'p')
endif
set noswapfile
set undofile
let &undodir = &backupdir
