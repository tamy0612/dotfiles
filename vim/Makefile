PWD=$(shell pwd)

DIRS=$(addprefix $(PWD)/, bundle back)

all:
	mkdir $(DIRS)
	git clone git://github.com/Shougo/neobundle.vim $(PWD)/bundle/neobundle.vim
	ln -s vimshrc ~/.vimshrc

.PHONY: clean
clean:
	rm -rf $(DIRS)
