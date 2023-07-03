TMUX_HOME = $(XDG_HOME)/tmux

.PHONY: tmux
tmux: $(TMUX_HOME)

$(TMUX_HOME): xdg
	@ln -s $(CWD)/tmux $@

.PHONY: tmux-clean
tmux-clean:
	@rm -rf $(TMUX_HOME)
