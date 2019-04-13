#!/usr/bin/env bash
#
# Author: yangxingwu <xingwu.yang@gmail.com>
# Description: script to install neovim on mac

# install python3
brew install python
# virtualenv for both python3
pip3 install virtualenv

# install python2
brew install python@2
# virtualenv for python2
pip2 install virtualenv

# install neovim
brew install neovim
