# default
alias grep='grep --color=auto'

if type colordiff > /dev/null 2>&1 ; then
  alias diff='colordiff'
fi


# ls family
if type exa > /dev/null 2>&1 ; then
    alias ls='exa --group-directories-first'
    alias la='ls -a'
    alias lt='ls -T -L 2'
    alias lta='ls -Tl'
else
    alias la='ls -A'
    if type tree > /dev/null 2>&1 ; then
      alias lt='tree'
      alias lta='tree -a'
    fi
fi
alias ll='ls -lhF'
alias lla='la -lhF'
alias lr='ls -R'
alias llr='ll -R'
alias lar='la -R'
alias llar='lla -R'


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
