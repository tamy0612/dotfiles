# additional path
path=(
    $HOME/bin(N-/)
    $HOME/.local/bin(N-/)
    ${path}
)

# Anyenv
if [ -d $HOME/.anyenv ] ; then
  typeset -Tx ANYENV_ROOT anyenv_root
  typeset -U anyenv_root
  anyenv_root=($HOME/.anyenv)
  path=(
    ${anyenv_root}/bin(N-/)
    ${path}
  )
  eval "$(anyenv init - --no-rehash)"
fi

# Rust
if [ -d $HOME/.cargo ] ; then
  typeset -Tx RUST_HOME rust_home
  typeset -U rust_home
  rust_home=($HOME/.cargo)
  path=(
    ${rust_home}/bin(N-/)
    ${path}
  )
fi

# Go
export GOENV_GOPATH_PREFIX=${XDG_DATA_HOME}/go
path=(
    $(go env GOPATH)/bin(N-/)
    ${path}
)

# R
if type R > /dev/null 2>&1 ; then
  typeset -Tx R_HOME r_home
  typeset -U r_home
  rhome=(`R RHOME`)
fi

# D lang
if type dmd > /dev/null 2>&1 ; then
  typeset -Tx D_IMPORT_DIR d_import_dir
  typeset -U d_import_dir
  d_import_dir=(
    /usr/local/include/d2(N-/)
    /usr/include/dmd/druntime/import(N-/)
    /usr/include/dmd/phobos(N-/)
  )
fi

# FZF
if [ -e $FZF_HOME ] ; then
    if type rg > /dev/null 2>&1 ; then
        export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_T_COMMAND="$FZF_DEFAULT_COMMAND"
    elif type ag > /dev/null 2>&1 ; then
        export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_T_COMMAND="$FZF_DEFAULT_COMMAND"
    fi
    export FZF_DEFAULT_OPTS='
        --reverse
        --color info:108,prompt:109,spinner:108,pointer:168,marker:168
    '
    export FZF_COMPLETION_OPTS='
        --preview "(head -n 50 {} || tree {}) 2> /dev/null"
    '
fi

# ESP IDF
export ESP_HOME=$HOME/.esp
if [ -d $ESP_HOME ]; then
    export IDF_PATH=$ESP_HOME/esp-idf
    export IDF_TOOLS_PATH=$ESP_HOME/espressif
fi
