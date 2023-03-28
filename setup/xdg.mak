XDG_CONFIG  = $(HOME)/.config
XDG_CACHE   = $(HOME)/.cache
XDG_DATA    = $(HOME)/.local.share

.PHONY: xdg
xdg: $(XDG_CONFIG) $(XDG_CACHE) $(XDG_DATA)

$(XDG_CONFIG):
	@mkdir -p $@

$(XDG_CACHE):
	@mkdir -p $@

$(XDG_DATA):
	@mkdir -p $@
