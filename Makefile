OS  = $(shell uname)
CWD = $(shell pwd)

all: xdg
	@echo "Usage:\n  make [xdg|zsh|vim|tmux]"

include setup/xdg.mak
include setup/zsh.mak
include setup/tmux.mak
include setup/vim.mak
