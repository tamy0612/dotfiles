## Exports
# lang
export LANG=en_US.UTF-8
export KCODE=u

# path
path=(
  /Library/TeX/texbin(N-/)
  ${path}
)

# Editor
if type nvim > /dev/null 2>&1 ; then
    export EDITOR="nvim"
elif [ -x "/usr/local/bin/vim" ] ; then
    export EDITOR='/usr/local/bin/vim'
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
