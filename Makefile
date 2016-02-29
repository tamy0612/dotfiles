OS          = $(shell uname)
PWD    	    = $(shell pwd)
ANYENV_REPO = "https://github.com/riywo/anyenv"

all:
	@echo "Usage:"
	@echo "  make <zsh|gnuplot|vim|nvim|anyenv|homebrew>"

zsh:
	@[ -d $(HOME)/.zsh ] || ln -s $(PWD)/zsh $(HOME)/.zsh
	@[ -f $(HOME)/.zshenv ] || ln -s $(PWD)/zsh/zshenv $(HOME)/.zshenv
	@[ -f $(HOME)/.zshrc ] || ln -s $(PWD)/zsh/zshrc $(HOME)/.zshrc
	@[ type zcompile > /dev/null 2>&1 ] && ( zsh -fc "zcompile $(HOME)/.zshenv" ) & ( zsh -fc "zcompile $(HOME)/.zshrc" )

gnuplot:
	@[ -f $(HOME)/.gnuplot ] || ln -s $(PWD)/gnuplot $(HOME)/.gnuplot

vim:
	@[ -d $(HOME)/.vim ] || ln -s $(PWD)/vim $(HOME)/.vim

nvim:
	@[ -d $(HOME)/.config ] || mkdir -p $(HOME)/.config
	@[ -d $(HOME)/.config/nvim ] || ln -s $(PWD)/vim $(HOME)/.config/nvim

anyenv:
	@[ -d $(HOME)/.anyenv ] || git clone $(ANYENV_REPO) $(HOME)/.anyenv

homebrew:
ifeq ($(OS),Darwin)
	@[ $(shell which brew 2> /dev/null) ] || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	@echo "Nothing to do for OS: $(OS)"
endif
