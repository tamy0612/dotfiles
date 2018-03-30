## Exports
# lang
export LANG=en_US.UTF-8
export KCODE=u

# path
path=(
  /Applications/MAMP/bin/php/php5.4.10/bin(N-/)
  /Applications/Octave.app/Contents/Resources/bin(N-/)
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

# homebrew
export BREW_HOME=/usr/local/Cellar

# java home
if [ -x "/usr/libexec/java_home" ] ; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# curl setting
if [ -f $HOME/.curl/ca-bundle.crt ]; then
  export CURL_CA_BUNDLE=$HOME/.curl/ca-bundle.crt
fi

## Alias
# rm
# if type rmtrash > /dev/null 2>&1 ; then
#     alias rm='rmtrash'
#     alias sysrm='/bin/rm'
# fi

# Gnu core-utils
if type gls > /dev/null 2>&1 ; then
  alias ls='gls -F --color=auto'
fi
if type gtimeout > /dev/null 2>&1 ; then
  alias timeout='gtimeout'
fi
