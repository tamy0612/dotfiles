# init anyenv
if type anyenv > /dev/null 2>&1 ; then
    eval "$(anyenv init - --no-rehash)"
fi

# init thefuck
if type thefuck > /dev/null 2>&1 ; then
    eval $(thefuck --alias)
    alias fuck='eval $(thefuck $(fc -ln -1))'
fi

# gotop
if type gotop > /dev/null 2>&1 ; then
    alias top=gotop
fi

if type fzf > /dev/null 2>&1 ; then
    if type rg > /dev/null 2>&1 ; then
        export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!.ccls-cache/*"'
    fi
    if type bat > /dev/null 2>&1 ; then
        export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid --line-range :100 {}"'
    fi
fi
