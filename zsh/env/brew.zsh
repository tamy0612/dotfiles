# Homebrew/Linuxbrew
case ${OSTYPE} in
    linux*)
        path=(
            {$HOME/.linuxbrew,/home/linuxbrew/.linuxbrew}/bin(N-/)
            ${path}
        )
        ;;
esac

if type brew > /dev/null 2>&1 ; then
    export BREW_HOME=$(brew --prefix)
    path=(
        $BREW_HOME/bin
        ${path}
    )
    sudo_path=(
        $BREW_HOME/sbin
        ${sudo_path}
    )
    ld_library_path=(
        $BREW_HOME/lib
        ${ld_library_path}
    )
    manpath=(
        $BREW_HOME/share/man
        ${manpath}
    )
    infopath=(
        $BREW_HOME/share/info
    )
fi
