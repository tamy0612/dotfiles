## load plugins
_load_plugins() {
    [[ -e $1 ]] && source $1
}

export ZPLUGINDIR=$ZDIR/plugins

# completion
_load_plugins $ZPLUGINDIR/zsh-completions/zsh-completions.plugin.zsh

# jumper
export _Z_CMD=j
export _Z_DATA=$ZSH_CACHE_DIR/z_data
[[ ! -f $_Z_DATA ]] && touch $_Z_DATA
_load_plugins $ZPLUGINDIR/z.sh/z.sh

# auto suggestions
_load_plugins $ZPLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^f' forward-word
bindkey '^k' autosuggest-accept

# syntax highlighting
_load_plugins $ZPLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
