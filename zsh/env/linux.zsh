# set ls color
alias ls='ls -F --color=auto'

# set editor to vim
export EDITOR="/usr/bin/vi"
[[ -x "/usr/bin/vim" ]] && export EDITOR="/usr/bin/vim"
[[ -x "/usr/local/bin/vim" ]] && export EDITOR="/usr/local/bin/vim"
alias vim=$EDITOR
alias vi=$EDITOR

# D lang
export D_IMPORT_DIR=/usr/include/dmd

# R home
export R_HOME=/usr/lib/R
