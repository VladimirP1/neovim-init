all: install

install: ~/.local/share/nvim/site/autoload/plug.vim ~/.config/nvim/init.vim
	nvim +PlugInstall +qa

.PHONY: all install

~/.local/share/nvim/site/autoload/plug.vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

~/.config/nvim/init.vim:
	sh -c 'echo Overwrite ~/.local/share/nvim/site/autoload/plug.vim ? && read && cp init.vim ~/.config/nvim/init.vim'
