# Editor
if type nvim > /dev/null 2>&1 ; then
    export EDITOR="nvim"
elif type vim > /dev/null 2>&1 ; then
    export EDITOR="vim"
else
    export EDITOR="vi"
fi
