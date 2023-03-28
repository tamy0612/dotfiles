VIM_HOME  = $(HOME)/.vim
NVIM_HOME = $(XDG_CONFIG)/nvim

$(VIM_HOME): xdg
	@ln -s $(CWD)/vim $@

$(NVIM_HOME): xdg
	@ln -s $(CWD)/vim $@

.PHONY: vim-clean
vim-clean:
	@rm -rf $(VIM_HOME) $(NVIM_HOME)
