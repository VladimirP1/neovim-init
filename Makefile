all:
	echo You can 'make install' or 'make update'

install: ~/.local/share/nvim/site/autoload/plug.vim ~/.config/nvim/init.vim
	nvim +PlugInstall "+call coc#util#install()" +qa

update:
	sh -c 'cd ~/.config/nvim && git pull'
	nvim +PlugUpdate "+call coc#util#install()" +qa

.PHONY: all install ~/.config/nvim/init.vim

~/.local/share/nvim/site/autoload/plug.vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

~/.config/nvim/init.vim:
	mkdir -p ~/.config/nvim
	sh -c 'echo Overwrite ~/.config/nvim/init.vim "?" && read p && cp -frv .git * ~/.config/nvim'
