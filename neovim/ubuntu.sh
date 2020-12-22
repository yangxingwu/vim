#!/usr/bin/env bash

# install neovim
sudo apt install neovim

# neovim configuration
mkdir -p ~/.config/nvim/
ln -s ~/vimrc-backup/neovim/init.vim ~/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install shellcheck
sudo apt-get install ShellCheck
