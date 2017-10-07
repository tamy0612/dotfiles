# default
alias grep='grep --color=auto'

if type colordiff > /dev/null 2>&1 ; then
  alias diff='colordiff'
fi


# ls family
## normal list
if type exa > /dev/null 2>&1 ; then
    alias ls='exa --group-directories-first'
    alias la='ls -am'
else
    alias la='ls -A'
fi
## List list
if type exa > /dev/null 2>&1 ; then
    alias ll='ls -lThFg -L 2'
    alias lla='ll -muU'
else
    alias ll='ls -lhF'
    alias lla='la -lhF'
fi
## Tree list
if type exa > /dev/null 2>&1 ; then
    alias lt='ls -Tm -L 2 -lhF'
    alias lta='lt -l'
elif type tree > /dev/null 2>&1 ; then
    alias lt='tree'
    alias lta='tree -a'
else
    alias lt='ls'
    alias lta='la'
fi


# clear
alias cl='clear'
alias cls='clear; echo "Location: `pwd`";ls'


# shortcuts
alias hist='history'
alias datef='date "+%Y%m%d_%H%M%S"'
alias q='exit'


# applications
if type R > /dev/null 2>&1 ; then
  alias R='R --no-save'
fi
