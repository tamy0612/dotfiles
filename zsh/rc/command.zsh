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
