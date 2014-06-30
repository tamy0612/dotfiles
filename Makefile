PWD = $(shell pwd)

all:
	#===========================
	@echo move to home dir
	@cd ~
	#===========================
	@echo create symlinks
	ln -s $(PWD)/.vim
	ln -s $(PWD)/.zsh/.zshenv
	ln -s ~/.vim/script/vimrc
	#===========================
	@echo back to $(PWD)
	@cd $(PWD)
