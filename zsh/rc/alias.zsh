# default
case ${OSTYPE} in
  darwin*)
    alias ls='ls -F -G'
    ;;
  linux*)
    alias ls='ls -F --color=auto'
    ;;
esac

alias grep='grep --color=auto'

if type colordiff > /dev/null 2>&1 ; then
  alias diff='colordiff'
fi


# ls family
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lhA'
alias lr='ls -R'
alias llr='ll -R'
alias lar='la -R'
alias llar='lla -R'
alias ..='cd ..'
if type tree > /dev/null 2>&1 ; then
  alias lt='tree'
  alias lta='tree -a'
fi


# clear
alias cl='clear'
alias cls='clear; ls'


# shortcuts
alias hist='history'
alias datef='date "+%Y%m%d_%H%M%S"'
alias q='exit'


# applications
if type R > /dev/null 2>&1 ; then
  alias R='R --no-save'
fi