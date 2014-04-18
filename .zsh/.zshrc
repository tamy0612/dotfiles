# binding
bindkey -v

# Coloring
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# Completion
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'
zstyle ':completion:*:default' menu select
zstyle ':completion:*:sudo:*' command-path $PATH
setopt correct
setopt list_packed
setopt complete_aliases

# Histry
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# cd
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# Options
setopt print_eight_bit
setopt correct
setopt print_exit_value

# Prompt
if [ $TERM = "dumb" ]; then
  PROMPT='%m:%c %n%(!.#.$) '
else
  autoload -Uz colors && colors
  PROMPT="%{${fg[green]}%}%m:%{${fg[yellow]}%}%c%{${fg[green]}%} %n%(!.#.$) %{${reset_color}%}"
  PROMPT2="%{${fg[green]}%}%_ > %{${reset_color}%}"
  SPROMPT="%{${fg[white]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
  RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
  setopt prompt_subst
  setopt prompt_percent
  setopt transient_rprompt
  unsetopt promptcr
fi

# load local settings
[[ -s "$HOME~/.zshrc.mine" ]]; source "$HOME/.zshrc.mine"
