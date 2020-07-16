######################################################################
# @author      : Derek 'Vlek' McCammond (dmccammond25@gmail.com)
# @file        : Makefile
# @created     : Wednesday Jul 15, 2020 11:56:48 EDT
######################################################################

SHELL=/bin/bash
DOTFILES_DIR:=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PATH:=$(DOTFILES_DIR)/bin:$(PATH)
PKG_MNGR=apt
LIBS=wget curl git python3 ruby cmus ranger stow zsh
PYTHON_PACKAGES=flake8 isort mypy pytest black

packages: zsh vim python last

main:
	sudo $(PKG_MNGR) update
	sudo $(PKG_MNGR) upgrade -y
	sudo $(PKG_MNGR) install $(LIBS)
	sudo gem install tmuxinator

zsh: main
	chsh -s /usr/bin/zsh
	# Ohmyzsh
	if [ ! -d ~/.ohmyzsh ]; then \
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
	fi
	# Theme: Power level 10k
	power_level_theme_dir=${zsh_custom:-$home/.oh-my-zsh/custom}/themes/powerlevel10k
	if [ ! -d $(power_level_theme_dir) ]; then \
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $(power_level_theme_dir); \
	fi

python:
	if [ ! -d ~/.pyenv ]; then \
		git clone https://github.com/pyenv/pyenv.git ~/.pyenv; \
		latest_py_version=`pyenv install --list | grep -v - | grep -v b | tail -1`; \
		env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $(latest_py_version); \
		pyenv global $(latest_py_version); \
	fi
	if [ ! -d ~/.poetry ]; then \
		curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python; \
	fi
	pip install $(PYTHON_PACKAGES)

vim: python
	sudo $(PKG_MNGR) install neovim
	pip install neovim
	vim +PlugInstall +qall > /dev/null
	python ~/.vim/plugged/YouCompleteMe/install.py

link: main
	for FILE in $$(\ls -A runcom); do \
		if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then \
			mv -v $(HOME)/$$FILE{,.bak}; \
		fi; \
	done
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME) runcom
	stow -t $(XDG_CONFIG_HOME) config

last:
	exec zsh
