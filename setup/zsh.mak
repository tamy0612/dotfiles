.PHONY: zsh
zsh: $(HOME)/.zsh $(HOME)/.zshenv $(HOME)/.zprofile $(HOME)/.zshrc

$(HOME)/.zsh:
	@ln -s $(CWD)/zsh $@

$(HOME)/.zshrc:
	@ln -s $(CWD)/zsh/zshrc $@

$(HOME)/.zprofile:
	@ln -s $(CWD)/zsh/zprofile $@

$(HOME)/.zshenv:
	@ln -s $(CWD)/zsh/zshenv $@

.PHONY: zsh-clean
zsh-clean:
	@rm -rf $(HOME)/.zsh $(HOME)/.zshrc $(HOME)/.zshenv $(HOME)/.zshrc.zwc $(HOME)/.zshenv.zwc
