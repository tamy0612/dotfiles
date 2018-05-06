export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

for dir in $XDG_CONFIG_HOME $XDG_CACHE_HOME $XDG_DATA_HOME
do
    [[ -d $dir ]] || mkdir -p $dir
done
