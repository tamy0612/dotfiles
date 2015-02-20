PWD = $(shell pwd)

all:
	make init-zsh
	make init-vim
	make init-gnuplot

init-zsh:
	@cd $(HOME)
	@[ -d $(HOME)/.zsh ] || ln -s $(PWD)/zsh $(HOME)/.zsh
	@[ -f $(HOME)/.zshenv ] || ln -s $(PWD)/zsh/zshenv $(HOME)/.zshenv
	@[ -f $(HOME)/.zshrc ] || ln -s $(PWD)/zsh/zshrc $(HOME)/.zshrc
	@[ type zcompile > /dev/null 2>&1 ] && ( zsh -fc "zcompile $(HOME)/.zshenv" ) & ( zsh -fc "zcompile $(HOME)/.zshrc" )
	@cd $(PWD)

init-gnuplot:
	@cd $(HOME)
	@[ -f $(HOME)/.gnuplot ] || ln -s $(PWD)/gnuplot $(HOME)/.gnuplot
	@cd $(PWD)

init-vim:
	@cd $(HOME)
	@[ -d $(HOME)/.vim ] || ln -s $(PWD)/vim $(HOME)/.vim
	@cd $(PWD)
