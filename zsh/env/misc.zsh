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
