## Exports
# lang
export LANG=en_US.UTF-8
export KCODE=u

# TeX
path=(
    /Library/TeX/texbin(N-/)
    ${path}
)

# Clang
path=(
    ${HOMEBREW_PREFIX}/opt/llvm/bin(N-/)
    ${path}
)
ld_library_path=(
    ${HOMEBREW_PREFIX}/opt/llvm/lib(N-/)
    ${ld_library_path}
)
manpath=(
    ${HOMEBREW_PREFIX}/opt/llvm/share/man(N-/)
    ${manpath}
)

# Golang
if type go > /dev/null 2>&1 ; then
    export GOPATH=$HOME/Workspace/golang
    if [ ! -d $GOPATH ] ; then
        mkdir $GOPATH
    fi
    path=(
        ${GOPATH}/bin
        ${path}
    )
fi

# Editor
if [ -x "${HOMEBREW_PREFIX}/bin/vim" ] ; then
    export EDITOR="${HOMEBREW_PREFIX}/bin/vim"
elif type vim > /dev/null 2>&1 ; then
    export EDITOR="vim"
elif [ -d "/Applications/MacVim.app" ] ; then
    export EDITOR='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim'
    alias vim=$EDITOR
else
    export EDITOR='/usr/bin/vim'
fi

# java home
if [ -x "/usr/libexec/java_home" ] ; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# curl setting
if [ -f $HOME/.curl/ca-bundle.crt ]; then
    export CURL_CA_BUNDLE=$HOME/.curl/ca-bundle.crt
fi

# FZF
if [ -e ${HOMEBREW_PREFIX}/opt/fzf ]; then
    export FZF_HOME=${HOMEBREW_PREFIX}/opt/fzf
    export FZF_PLUGIN_DIR=$FZF_HOME/shell
fi

# MySQL client
path=(
    ${HOMEBREW_PREFIX}/opt/mysql-client/bin(N-/)
    ${path}
)
