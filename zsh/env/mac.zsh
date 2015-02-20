## Exports
# lang
export LANG=ja_JP.UTF-8
export KCODE=u


# path
path=(
  /usr/local/bin(N-/)
  /Applications/MAMP/bin/php/php5.4.10/bin(N-/)
  /Applications/pTeX.app/teTeX/bin(N-/)
  $HOME/Library/TeXShop/bin(N-/)
  /Applications/Octave.app/Contents/Resources/bin(N-/)
  ${path}
)

# homebrew
if type brew > /dev/null 2>&1 ; then
  export BREW_HOME=/usr/local/Cellar
fi

# rsense
if brew --prefix rsense > /dev/null 2>&1 ; then
  export RSENSE_HOME=`brew --prefix rsense`
fi

# set R_HOME
if type R > /dev/null 2>&1 ; then
  export R_HOME=/Library/Frameworks/R.framework/Resources
fi

# curl setting
if [ -f $HOME/.curl/ca-bundle.crt ]; then
  export CURL_CA_BUNDLE=$HOME/.curl/ca-bundle.crt
fi

## Alias
# vim
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim'
alias vi='vim'
alias gvim='/Applications/MacVim.app/Contents/MacOS/MacVim'
alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'

# rm
alias rm='rmtrash'
