#!/bin/bash

# Reference
# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

if [ -z $VIM_DIR ]; then
    echo "VIM_DIR is not set, will exit"
    exit 1
fi

# Install all the prerequisite libraries
apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

# Remove vim if you have it already
apt remove vim vim-runtime gvim

# build from source
cd $VIM_DIR
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-pythoninterp=yes \
    --with-python-config-dir=/usr/lib/python2.7/config \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.5/config \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80

# install vim
apt install checkinstall
cd $VIM_DIR
checkinstall

# set vim as your default editor with update-alternatives
update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
update-alternatives --set editor /usr/local/bin/vim
update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
update-alternatives --set vi /usr/local/bin/vim
