# default
alias grep='grep --color=auto'

if type colordiff > /dev/null 2>&1 ; then
    alias diff='colordiff'
fi


# ls
if type eza > /dev/null 2>&1 ; then
    alias ls='eza --group-directories-first'
    alias la='ls -am'
    alias ll='ls -lThFg -L 2'
    alias lla='ll -muU'
    alias lt='ls -Tm -L 2 -lhF'
    alias lta='lt -l'
else
    case ${OSTYPE} in
        darwin*)
            if type gls > /dev/null 2>&1 ; then
                alias ls='gls -F --color=auto'
            fi
            ;;
        linux*)
            alias ls='ls -F --color=auto'
            ;;
    esac
    alias la='ls -A'
    alias ll='ls -lhF'
    alias lla='la -lhF'
    if type tree > /dev/null 2>&1 ; then
        alias lt='tree'
        alias lta='tree -a'
    else
        alias lt='ls'
        alias lta='la'
    fi
fi


# cd with ls
function chpwd() { ls }


# clear
alias cl='clear'
alias cls='clear; echo "Location: `pwd`";ls'


# shortcuts
alias hist='history'
alias datef='date "+%Y%m%d_%H%M%S"'
alias q='exit'
alias colormap='
for c in {000..255}
do
    echo -n "\e[38;5;${c}m $c"; [ $(($c%16)) -eq 15 ] && echo
done; echo;
for c in {000..255}
do
    echo -n "\e[1;38;5;${c}m $c"; [ $(($c%16)) -eq 15 ] && echo;
done; echo;
for c in {000..255}
do
    echo -n "\e[30;48;5;${c}m $c"; [ $(($c%16)) -eq 15 ] && echo;
done; echo -n "\e[0m"
'


# applications
if type R > /dev/null 2>&1 ; then
    alias R='R --no-save'
fi


# tmux
if type tmux > /dev/null 2>&1; then
    alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
fi
if [ -n "${TMUX}" ]; then
    alias sp="tmux split-window -v -c ${PWD}"
    alias vs="tmux split-window -h -c ${PWD}"
    alias detach="tmux detach"
else
    alias attach="open_tmux"
fi
