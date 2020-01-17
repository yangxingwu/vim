#!/usr/bin/env bash

# create a soft link for init.vim
ln -s ~/Development-Environment/neovim/init.vim ~/.config/nvim/init.vim

# on-my-zsh
sudo yum install zsh
sudo chsh $USER --shell /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# dev tools (gcc, git, etc)
sudo yum group install "Development Tools"

# neovim
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y neovim # python{2,34}-neovim

# neovim configuration
mkdir -p ~/.config/nvim/
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
