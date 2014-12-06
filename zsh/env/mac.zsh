# homebrew
export BREW_HOME=/usr/local/Cellar

# D lang
export D_HOME=$BREW_HOME/dmd/`ls $BREW_HOME/dmd | awk 'END{print $NF}'`
export D_IMPORT_DIR=/usr/local/include/d2

# php
path=(/Applications/MAMP/bin/php/php5.4.10/bin ${path})

# rsense
export RSENSE_HOME=$BREW_HOME/rsense/0.3

# vim
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim'
alias vi='vim'
alias gvim='/Applications/MacVim.app/Contents/MacOS/MacVim'
alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'

# latex
path=(
  /Applications/pTeX.app/teTeX/bin
  /usr/local/bin
  $HOME/Library/TeXShop/bin
  ${path}
)

# octave setting
path=(
  /Applications/Octave.app/Contents/Resources/bin
  ${path}
)

# set R_HOME
export R_HOME=/Library/Frameworks/R.framework/Resources

# curl setting
if [ -f $HOME/.curl/ca-bundle.crt ]; then
  export CURL_CA_BUNDLE=$HOME/.curl/ca-bundle.crt
fi

# Alias
alias rm='rmtrash'
