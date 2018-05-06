# sudo path
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=(
    {/usr/local,/usr,}/sbin(N-/)
)

# path
typeset -U PATH path
path=(
    {/usr/local,/usr,}/bin(N-/)
    ${path}
)

# library
typeset -xT LD_LIBRARY_PATH ld_library_path
typeset -U ld_library_path
ld_library_path=(
    {/usr/local,/usr}/lib(N-/)
)

# man
typeset -U MANPATH manpath
manpath=(
    {/usr/local,/usr}/share/man(N-/)
)

# info
typeset -xT INFOPATH infopath
typeset -U infopath
infopath=(
    {/usr/local,/usr}/share/info(N-/)
)
