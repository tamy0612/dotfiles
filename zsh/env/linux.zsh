# Editor
if type nvim > /dev/null 2>&1 ; then
    export EDITOR="nvim"
    alias vim="${EDITOR} -c Project"
elif type vim > /dev/null 2>&1 ; then
    [[ -x "/usr/bin/vim" ]] && export EDITOR="/usr/bin/vim"
    [[ -x "/usr/local/bin/vim" ]] && export EDITOR="/usr/local/bin/vim"
    alias vim=$EDITOR
else
    export EDITOR="vi"
    alias vim="vi"
fi
alias vi=$EDITOR

# set ls color
alias ls='ls -F --color=auto'
