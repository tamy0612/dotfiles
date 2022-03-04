# Homebrew/Linuxbrew
case ${OSTYPE} in
    linux*)
        path=(
            {$HOME/.linuxbrew,/home/linuxbrew/.linuxbrew}/bin(N-/)
            ${path}
        )
        ;;
    darwin*)
        path=(
            /opt/homebrew/bin(N-/)
            ${path}
        )
        ;;
esac

if type brew > /dev/null 2>&1 ; then
    export HOMEBREW_PREFIX=$(brew --prefix)
    export HOMEBREW_CELLAR=${HOMEBREW_PREFIX}/Cellar
    export HOMEBREW_REPOSITORY=${HOMEBREW_PREFIX}
    path=(
        ${HOMEBREW_PREFIX}/bin
        ${path}
    )
    sudo_path=(
        ${HOMEBREW_PREFIX}/sbin
        ${sudo_path}
    )
    ld_library_path=(
        ${HOMEBREW_PREFIX}/lib
        ${ld_library_path}
    )
    manpath=(
        ${HOMEBREW_PREFIX}/share/man
        ${manpath}
    )
    infopath=(
        ${HOMEBREW_PREFIX}/share/info
    )
fi
