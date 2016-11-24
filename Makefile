OS          = $(shell uname)
PWD    	    = $(shell pwd)

XDG_CONFIG  = $(HOME)/.config
ANYENV_HOME = $(HOME)/.anyenv
ZSH_HOME    = $(HOME)/.zsh
VIM_HOME    = $(HOME)/.vim
NVIM_HOME   = $(XDG_CONFIG)/nvim

PYENV       = $(ANYENV_HOME)/envs/pyenv
PYTHON2_VER = 2.7.9
PYTHON3_VER = 3.5.2

.PHONY: zsh vim


all:
	@echo "Usage:"
	@echo "  make <zsh|gnuplot|vim|nvim|anyenv|homebrew>"


# zsh
zsh: $(ZSH_HOME) $(HOME)/.zshenv.zwc $(HOME)/.zshrc.zwc
	@git submodule update --init --recursive

$(ZSH_HOME):
	@ln -s $(PWD)/zsh $@

$(HOME)/.zshenv:
	@ln -s $(PWD)/zsh/zshenv $@

$(HOME)/.zshrc:
	@ln -s $(PWD)/zsh/zshrc $@

%.zwc: %
	@[ type zcompile > /dev/null 2>&1 ] && zsh -fc "zcompile %"


# vim
vim: $(VIM_HOME)

nvim: $(XDG_CONFIG) $(NVIM_HOME) $(PYENV)/versions/neovim2 $(PYENV)/versions/neovim3

$(XDG_CONFIG):
	@mkdir -p $@

$(VIM_HOME):
	@ln -s $(PWD)/vim $@

$(NVIM_HOME): $(XDG_CONFIG)
	@ln -s $(PWD)/vim $@

$(PYENV)/versions/neovim2: $(PYENV)/plugins/pyenv-virtualenv
	@pyenv install $(PYTHON2_VER)
	@pyenv virtualenv $(PYTHON2_VER) neovim2
	@pyenv activate neovim2
	@pip install --upgrade pip
	@pip install neovim flake8 jedi
	@pyenv deactivate

$(PYENV)/versions/neovim3: $(PYENV)/plugins/pyenv-virtualenv
	@pyenv install $(PYTHON3_VER)
	@pyenv virtualenv $(PYTHON3_VER) neovim3
	@pyenv activate neovim3
	@pip3 install --upgrade pip
	@pip3 install neovim flake8 jedi
	@pyenv deactivate


# *env
anyenv: $(ANYENV_HOME) $(ANYENV_HOME)/plugins/anyenv-update

$(ANYENV_HOME):
	@git clone https://github.com/riywo/anyenv $@

$(ANYENV_HOME)/plugins: $(ANYENV_HOME)
	@mkdir -p $@

$(ANYENV_HOME)/plugins/anyenv-update: $(ANYENV_HOME)/plugins
	@git clone https://github.com/znz/anyenv-update $@

pyenv: $(PYENV) $(PYENV)/plugins/pyenv-virtualenv

$(PYENV): $(ANYENV_HOME)
	@anyenv install pyenv

$(PYENV)/plugins:
	@mkdir -p $@

$(PYENV)/plugins/pyenv-virtualenv: $(PYENV)/plugins
	@git clone https://github.com/yyuu/pyenv-virtualenv $@


# others
gnuplot:
	@[ -f $(HOME)/.gnuplot ] || ln -s $(PWD)/others/gnuplot $(HOME)/.gnuplot

homebrew:
ifeq ($(OS),Darwin)
	@[ $(shell which brew 2> /dev/null) ] || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	@echo "Nothing to do for $(OS)"
endif
