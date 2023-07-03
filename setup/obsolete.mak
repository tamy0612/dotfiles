OS          = $(shell uname)
PWD         = $(shell pwd)

XDG_CONFIG  = $(HOME)/.config
XDG_CACHE   = $(HOME)/.cache
ANYENV_HOME = $(HOME)/.anyenv
ZSH_HOME    = $(HOME)/.zsh
VIM_HOME    = $(HOME)/.vim
NVIM_HOME   = $(XDG_CONFIG)/nvim
ONI_HOME    = $(HOME)/.oni

PYENV_HOME  = $(ANYENV_HOME)/envs/pyenv
PYTHON2_VER = 2.7.9
PYTHON3_VER = 3.5.2


# commands
.PHONY: zsh anyenv vim nvim gnuplot ctags clang-format homebrew oni
all:
	@echo "Usage:"
	@echo "  make <zsh|anyenv|pyenv|vim|nvim|gnuplot|homebrew>"

zsh: $(ZSH_HOME) $(HOME)/.zshenv.zwc $(HOME)/.zshrc.zwc
	@git submodule update --init --recursive

anyenv: $(ANYENV_HOME) $(ANYENV_HOME)/plugins/anyenv-update

pyenv: $(PYENV_HOME) $(PYENV_HOME)/plugins/pyenv-virtualenv

vim: $(VIM_HOME) $(XDG_CACHE)

nvim: $(NVIM_HOME) $(XDG_CACHE) $(PYENV_HOME) $(PYENV_HOME)/versions/neovim2 $(PYENV_HOME)/versions/neovim3

oni: $(ONI_HOME)
	@ln -s $(PWD)/vim/gui/oni/config.js $(ONI_HOME)/config.js

gnuplot: $(HOME)/.gnuplot

ctags: $(HOME)/.ctags

clang-format: $(HOME)/.clang-format

homebrew:
ifeq ($(OS),Darwin)
	@sh $(PWD)/setup/homebrew.sh
else
	@echo "Nothing to do for $(OS)"
endif

.PHONY: zsh-clean vim-clean vim-clean nvim-clean
zsh-clean:
	@rm -rf $(ZSH_HOME) $(HOME)/.zshenv $(HOME)/.zshrc $(HOME).zshenv.zwc $(HOME)/.zshrc.zwc

vim-clean:
	@rm -rf $(XDG_CACHE)/vim

nvim-clean:
	@rm -rf $(NVIM_HOME) $(XDG_CACHE)/vim


# dependencies
## xdg
$(XDG_CONFIG):
	@mkdir -p $@

$(XDG_CACHE):
	@mkdir -p $@

## zsh
$(ZSH_HOME):
	@ln -s $(PWD)/zsh $@

$(HOME)/.zshenv:
	@ln -s $(PWD)/zsh/zshenv $@

$(HOME)/.zshrc:
	@ln -s $(PWD)/zsh/zshrc $@

%.zwc: %
	@[ type zcompile > /dev/null 2>&1 ] && zsh -fc "zcompile $<"

## anyenv
$(ANYENV_HOME):
	@git clone https://github.com/riywo/anyenv $@

$(ANYENV_HOME)/plugins: $(ANYENV_HOME)
	@mkdir -p $@

$(ANYENV_HOME)/plugins/anyenv-update: $(ANYENV_HOME)/plugins
	@git clone https://github.com/znz/anyenv-update $@

## pyenv
$(PYENV_HOME): $(ANYENV_HOME)
	@anyenv install pyenv

$(PYENV_HOME)/plugins/pyenv-virtualenv: $(PYENV_HOME)/plugins
	@git clone https://github.com/yyuu/pyenv-virtualenv $@

$(PYENV_HOME)/plugins:
	@mkdir -p $@

## vim
$(VIM_HOME):
	@ln -s $(PWD)/vim $@

## nvim
$(NVIM_HOME): $(XDG_CONFIG)
	@ln -s $(PWD)/vim $@

$(PYENV_HOME)/versions/neovim2:
	@pyenv install $(PYTHON2_VER)
	@pyenv virtualenv $(PYTHON2_VER) neovim2
	@pyenv activate neovim2
	@pip install --upgrade pip
	@pip install neovim
	@pyenv deactivate

$(PYENV_HOME)/versions/neovim3:
	@pyenv install $(PYTHON3_VER)
	@pyenv virtualenv $(PYTHON3_VER) neovim3
	@pyenv activate neovim3
	@pip3 install --upgrade pip
	@pip3 install neovim
	@pyenv deactivate

# others
$(HOME)/.gnuplot:
	@ln -s $(PWD)/others/gnuplot $@

$(HOME)/.ctags:
	@ln -s $(PWD)/others/ctags $@

$(HOME)/.clang-format:
	@ln -s $(PWD)/others/clang-format $@

$(ONI_HOME):
	@mkdir -p $@
