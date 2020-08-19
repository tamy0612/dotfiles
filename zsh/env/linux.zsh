# Editor
if type nvim > /dev/null 2>&1 ; then
    export EDITOR="nvim"
elif type vim > /dev/null 2>&1 ; then
    export EDITOR="vim"
else
    export EDITOR="vi"
fi

if type fzf > /dev/null 2>&1 ; then
    export FZF_HOME=/usr/share/doc/fzf
    export FZF_PLUGIN_DIR=$FZF_HOME/examples
fi
