PWD = $(shell pwd)

all:
	@cd $(HOME)
	@[ -d $(HOME)/.vim ] || ln -s $(PWD)/vim $(HOME)/.vim
	@[ -e $(HOME)/.zshenv ] || ln -s $(PWD)/zsh/zshenv $(HOME)/.zshenv
	@cd $(PWD)

