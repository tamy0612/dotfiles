export ZDOTDIR=$HOME/dotfiles/.zsh

# load .profile
if [ -f $HOME/.profile ] ; then
  source $HOME/.profile
fi

# path
typeset -U PATH path
path=(
  /sbin
  /usr/local/bin
  ${path}
)

typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=(
  {/usr/local,/usr,}
  /sbin(N-/)
)

# set colors
export CLICOLOR=1
export LSCOLORS=ExGxcxdxCxegedabagacad

# anybenv
if [ -d $HOME/.anyenv ] ; then
  export ANYENV_ROOT="$HOME/.anyenv"
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# Alias
alias ls='ls -F'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lhA'
alias lr='ls -R'
alias llr='ll -R'
alias lar='la -R'
alias llar='lla -R'
alias lt='tree'
alias lta='tree -a'
alias cl='clear'
alias grep='grep --color=auto'
alias colorsed="perl $HOME/Dropbox/Share/bin/colorsed"
alias datef='date "+%Y%m%d_%H%M%S"'
alias R='R --no-save'
alias diff='colordiff'

# load settings
sysname=`uname`
[[ $sysname = 'Darwin' ]] && source $ZDOTDIR/env/mac.zsh
[[ $sysname = 'Linux' ]] && source $ZDOTDIR/env/linux.zsh
